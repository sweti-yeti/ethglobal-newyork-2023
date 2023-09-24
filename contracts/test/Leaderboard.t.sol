// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console2} from "forge-std/Test.sol";
import {Leaderboard} from "../src/Leaderboard.sol";

contract LeaderboardTest is Test {
    Leaderboard public leaderboard;

    function setUp() public {
        leaderboard = new Leaderboard();
    }
    
    function test_submitScore() public {
       bytes memory data = vm.parseJson(vm.readFile("./test/test_smol.json")); 
       leaderboard.submitScore(732, 488, data);
    }
}
