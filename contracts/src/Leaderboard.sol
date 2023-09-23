// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract Leaderboard {
    struct ScoreRecord {
        address wallet;
        uint64 time;
        uint64 distance;
    }

    mapping(address => string) gameplayLogs;

    function submitScore(uint64 time, uint64 distance, bytes calldata) public {

    }

    function getGameplayLog(address wallet) external view returns (string memory) {
        return gameplayLogs[wallet];
    }
}
