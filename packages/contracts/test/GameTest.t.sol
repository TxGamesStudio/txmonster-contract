// SPDX-License-Identifier: MIT
pragma solidity >=0.8.24;

import "forge-std/Test.sol";
import { MudTest } from "@latticexyz/world/test/MudTest.t.sol";

import { IWorld } from "../src/codegen/world/IWorld.sol";
import { User, Item, ItemData } from "../src/codegen/index.sol";

contract GameTest is MudTest {
  function testWorldExists() public {
    uint256 codeSize;
    address addr = worldAddress;
    assembly {
      codeSize := extcodesize(addr)
    }
    assertTrue(codeSize > 0);
  }

  function testCatching() public {
    
    // // Expect task to exist that we created during PostDeploy script
    // TasksData memory task = Tasks.get("1");
    // assertEq(task.description, "Walk the dog");
    // assertEq(task.completedAt, 0);

    // // Expect the task to be completed after calling completeTask from our TasksSystem
    // IWorld(worldAddress).txmonster__completeTask("1");
    // assertEq(Tasks.getCompletedAt("1"), block.timestamp);
  }
}
