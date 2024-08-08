// SPDX-License-Identifier: MIT
pragma solidity >=0.8.24;

import { System } from "@latticexyz/world/src/System.sol";
import { User, UserData, Item, ItemData } from "../codegen/index.sol";

contract GameSystem is System {
  uint256 internal entropyNonce = 1;

  event Catched(address player, bool succeed, uint16 itemId);

  function catching(uint16[] memory possibleRewards, uint16[] memory percentages) external {
    uint256 length = percentages.length;
    require(possibleRewards.length == length, "length not matched");

    uint256 rand = uint256(keccak256(abi.encode(++entropyNonce, msg.sender, block.timestamp, block.prevrandao)));
    uint random = rand % 10_000;
    uint sumPercentages = 0;
    uint16 selectedIdx = 0xffff;

    for(uint16 i; i < length; i++) {
      sumPercentages += percentages[i];
      if (sumPercentages > random && selectedIdx == 0xffff) {
        selectedIdx = i;
      }
    }

    require(sumPercentages == 10_000, "not 100%");
    uint16 itemId = possibleRewards[selectedIdx];
    
    require(itemId < User.getInventoryCap(msg.sender), "invalid item");
    if (itemId > 0) {
      // hit
      Item.setAmount(msg.sender, itemId, Item.getAmount(msg.sender, itemId) + 1);
    } else {
      // miss
    }

    emit Catched(msg.sender, itemId > 0, itemId);
  }
}
