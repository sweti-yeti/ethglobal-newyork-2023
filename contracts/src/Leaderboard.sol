// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract Leaderboard {
    struct ScoreRecord {
        uint64 time;
        uint64 distance;
    }

    uint64 leaderboardSize = 0;

    mapping(uint => address) leaderboard;
    mapping(address => ScoreRecord) scores;
    mapping(address => bytes) gameplayLogs;

    function submitScore(uint64 time, uint64 distance, bytes memory log) public {
        ScoreRecord memory current = scores[msg.sender];
        if(current.time <= time && current.distance <= distance) {
            scores[msg.sender] = ScoreRecord(time, distance);
            gameplayLogs[msg.sender] = log;
        }
        // Shuffle leaderboard positions
    }


    function getGameplayLog(address wallet) external view returns (bytes memory) {
        return gameplayLogs[wallet];
    }
    
    function getScore(address wallet) external view returns (ScoreRecord memory) {
        return scores[wallet];
    }
}
