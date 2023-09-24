// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/console.sol";
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
       console.logUint(leaderboard.leaderboardSize());
       console.logAddress(leaderboard.leaderboard(0));
       vm.prank(address(0x100));
       leaderboard.submitScore(730, 480, data);
       console.logUint(leaderboard.leaderboardSize());
       console.logAddress(leaderboard.leaderboard(0));
       console.logAddress(leaderboard.leaderboard(1));
       vm.prank(address(0x100));
       leaderboard.submitScore(750, 500, data);
       console.logUint(leaderboard.leaderboardSize());
       console.logAddress(leaderboard.leaderboard(0));
       console.logAddress(leaderboard.leaderboard(1));
       vm.prank(address(0x200));
       leaderboard.submitScore(70, 50, data);
       console.logUint(leaderboard.leaderboardSize());
       console.logAddress(leaderboard.leaderboard(0));
       console.logAddress(leaderboard.leaderboard(1));
       console.logAddress(leaderboard.leaderboard(2));
       vm.prank(address(0x300));
       leaderboard.submitScore(170, 150, data);
       console.logUint(leaderboard.leaderboardSize());
       console.logAddress(leaderboard.leaderboard(0));
       console.logAddress(leaderboard.leaderboard(1));
       console.logAddress(leaderboard.leaderboard(2));
       console.logAddress(leaderboard.leaderboard(3));
       vm.prank(address(0x0));
       leaderboard.submitScore(1000,1000, data);
       console.logUint(leaderboard.leaderboardSize());
       console.logAddress(leaderboard.leaderboard(0));
       console.logAddress(leaderboard.leaderboard(1));
       console.logAddress(leaderboard.leaderboard(2));
       console.logAddress(leaderboard.leaderboard(3));
       console.logAddress(leaderboard.leaderboard(4));
    }
}
