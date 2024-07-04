// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

/**
 * @title Raffle
 * @author Samuel Buritica
 * @notice This contract is for creating a sample raffle
 * @dev Implements Chainlink VRFv2.5
 */
contract Raffle {
    /** Errors */
    error Raffle__SendMoreToEnterRaffle();
    address payable[] private s_players;
    uint256 private immutable i_entraceFee;
    /** Events */
    event RaffleEntered(address indexed player);

    constructor(uint256 _entraceFee) {
        i_entraceFee = _entraceFee;
    }

    function enterRaffle() public payable {
        if (msg.value < i_entraceFee) {
            revert Raffle__SendMoreToEnterRaffle();
        }
        s_players.push(payable(msg.sender));
        emit RaffleEntered(msg.sender);
    }

    function pickWinner() public {}

    /** Getter Functions */
    function getEntranceFee() external view returns (uint256) {
        return i_entraceFee;
    }
}
