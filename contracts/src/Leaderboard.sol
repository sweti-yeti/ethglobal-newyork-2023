// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract Leaderboard {
    struct ScoreRecord {
        uint64 time;
        uint64 distance;
    }

    uint64 public leaderboardSize = 0;

    mapping(uint => address) public leaderboard;
    mapping(address => ScoreRecord) public scores;
    mapping(address => bytes) public gameplayLogs;

    function submitScore(uint64 time, uint64 distance, bytes calldata log) public {
        ScoreRecord memory current = scores[msg.sender];
        if(leaderboardSize == 0) {
            // Empty leaderboard, so just record the score
            leaderboard[leaderboardSize] = msg.sender;
            leaderboardSize++;
            // Record the score
            scores[msg.sender] = ScoreRecord(time, distance);
            gameplayLogs[msg.sender] = log;
        }

        else if(current.time == 0 && current.distance == 0) {
            // New score, start from the bottom and shift scores until position is found
            // Shuffle leaderboard positions
            uint i = leaderboardSize;
            ScoreRecord memory scoreMemo;
            for(i; i > 0; i--) {
                scoreMemo = scores[leaderboard[i-1]];
                if (time >= scoreMemo.time && distance > scoreMemo.distance) {
                    leaderboard[i] = leaderboard[i-1];
                }
                else {
                    break;
                }
            }
            leaderboard[i] = msg.sender;
            // Record the score
            scores[msg.sender] = ScoreRecord(time, distance);
            gameplayLogs[msg.sender] = log;
            leaderboardSize++;
        }

        else if(time >= current.time && distance >= current.distance) {
            // Improved score, start from top until new position is found,
            // then shift lower scores down until old position is found
            uint i = 0;
            ScoreRecord memory scoreMemo;
            for(i; i < leaderboardSize; i++) {
                scoreMemo = scores[leaderboard[i]];
                if (time >= scoreMemo.time && distance > scoreMemo.distance) {
                    break;
                }
            }

            address shifted = leaderboard[i];
            leaderboard[i] = msg.sender;
            address tmp = address(0);
            i++;
            for(i; i < leaderboardSize; i++) {
                if(leaderboard[i] == msg.sender) {
                   break; 
                }
                else {
                    tmp = leaderboard[i];
                    leaderboard[i] = shifted;
                    shifted = tmp;
                }
            }
            
            leaderboard[i] = shifted;

            // Record the score
            scores[msg.sender] = ScoreRecord(time, distance);
            gameplayLogs[msg.sender] = log;
        }
    }


    function getGameplayLog(address wallet) external view returns (bytes memory) {
        return gameplayLogs[wallet];
    }
    
    
    function getScore(address wallet) external view returns (ScoreRecord memory) {
        return scores[wallet];
    }
}
