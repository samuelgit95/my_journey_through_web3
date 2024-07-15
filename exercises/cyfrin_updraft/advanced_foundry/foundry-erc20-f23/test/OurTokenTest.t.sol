// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {Test} from "forge-std/Test.sol";
import {DeployOurToken} from "script/DeployOurToken.s.sol";
import {OurToken} from "src/OurToken.sol";

contract OurTokenTest is Test {
    OurToken public ourToken;
    DeployOurToken public deployer;
    error ERC20InsufficientAllowance(
        address spender,
        uint256 allowance,
        uint256 needed
    );

    address bob = makeAddr("bob");
    address alice = makeAddr("alice");
    address charlie = makeAddr("charlie");

    uint256 public constant STARTING_BALANCE = 100 ether;

    function setUp() public {
        deployer = new DeployOurToken();
        ourToken = deployer.run();

        vm.prank(msg.sender);
        ourToken.transfer(bob, STARTING_BALANCE);
    }

    function testBobBalance() public view {
        assertEq(ourToken.balanceOf(bob), STARTING_BALANCE);
    }

    function testAllowancesWorks() public {
        uint256 initialAllowance = 1000;

        // Bob approves Alice to spend token on her behalf
        vm.prank(bob);
        ourToken.approve(alice, initialAllowance);

        uint256 transferAmount = 500;

        vm.prank(alice);
        ourToken.transferFrom(bob, alice, transferAmount);
        assertEq(ourToken.balanceOf(alice), transferAmount);
        assertEq(ourToken.balanceOf(bob), STARTING_BALANCE - transferAmount);
    }

    function testTransferFromMultipleAddresses() public {
        uint256 allowanceAlice = 50 ether;
        uint256 allowanceCharlie = 25 ether;
        uint256 transferAmountAlice = 20 ether;
        uint256 transferAmountCharlie = 10 ether;

        // Bob approves Alice and Charlie to spend tokens on his behalf
        vm.prank(bob);
        ourToken.approve(alice, allowanceAlice);

        vm.prank(bob);
        ourToken.approve(charlie, allowanceCharlie);

        // Alice transfers tokens from Bob's account to herself
        vm.prank(alice);
        ourToken.transferFrom(bob, alice, transferAmountAlice);
        assertEq(ourToken.balanceOf(alice), transferAmountAlice);
        assertEq(
            ourToken.balanceOf(bob),
            STARTING_BALANCE - transferAmountAlice
        );

        // Charlie transfers tokens from Bob's account to himself
        vm.prank(charlie);
        ourToken.transferFrom(bob, charlie, transferAmountCharlie);
        assertEq(ourToken.balanceOf(charlie), transferAmountCharlie);
        assertEq(
            ourToken.balanceOf(bob),
            STARTING_BALANCE - transferAmountAlice - transferAmountCharlie
        );
    }

    function testTransferWithInsufficientAllowance() public {
        uint256 insufficientAllowance = 5 ether;
        uint256 transferAmount = 10 ether;

        // Bob approves Alice to spend tokens on his behalf
        vm.prank(bob);
        ourToken.approve(alice, insufficientAllowance);

        // Alice attempts to transfer more tokens than allowed
        vm.prank(alice);
        vm.expectRevert(
            abi.encodeWithSelector(
                ERC20InsufficientAllowance.selector,
                alice,
                insufficientAllowance,
                transferAmount
            )
        );
        ourToken.transferFrom(bob, alice, transferAmount);
    }

    function testAllowanceAndTransferToAnotherAddress() public {
        uint256 initialAllowance = 15 ether;
        uint256 transferAmount = 15 ether;

        // Bob approves Alice to spend tokens on his behalf
        vm.prank(bob);
        ourToken.approve(alice, initialAllowance);

        // Alice transfers tokens from Bob's account to Charlie
        vm.prank(alice);
        ourToken.transferFrom(bob, charlie, transferAmount);
        assertEq(ourToken.balanceOf(charlie), transferAmount);
        assertEq(ourToken.balanceOf(bob), STARTING_BALANCE - transferAmount);
    }
}
