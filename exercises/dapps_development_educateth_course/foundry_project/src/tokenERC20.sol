// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import {ERC20} from "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import {AccessControl} from "@openzeppelin/contracts/access/AccessControl.sol";

contract TokenERC20 is ERC20, AccessControl {
    bytes32 private constant MINTER = keccak256(abi.encodePacked("MINTER"));
    bytes32 private constant BURNER = keccak256(abi.encodePacked("BURNER"));

    uint256 public constant INITIALSUPPLY = 100_000_000;
    uint256 public holders;
    address public airdrop;

    error ZeroAddressNotAllowed();

    constructor(
        address _airdrop,
        address _minterAddress,
        address _burnerAddress
    ) ERC20("Blockitus Token", "ITOS") {
        if (_minterAddress == address(0)) revert ZeroAddressNotAllowed();
        if (_burnerAddress == address(0)) revert ZeroAddressNotAllowed();
        _grantRole(MINTER, _minterAddress);
        _grantRole(BURNER, _burnerAddress);
        airdrop = _airdrop;
        _mint(airdrop, INITIALSUPPLY * 10 ** decimals());
    }

    function mint(uint256 amount) public onlyRole(MINTER) {
        _mint(airdrop, amount);
    }

    function burn() public onlyRole(BURNER) {
        _burn(airdrop, 1 * 10 ** decimals());
    }

    // Override update function to include the number of holders
    function _update(
        address from,
        address to,
        uint256 value
    ) internal virtual override {
        if (balanceOf(to) == 0) {
            holders += 1;
        }
        if (balanceOf(from) == value) {
            holders -= 1;
        }
        super._update(from, to, value);
    }
}
