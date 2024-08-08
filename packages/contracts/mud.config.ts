import { defineWorld } from "@latticexyz/world";

export default defineWorld({
  namespace: "txmonster",
  deploy: {
    upgradeableWorldImplementation: true,
  },
  tables: {
    User: {
      schema: {
        player: "address",
        createdAt: "uint256",
        inventoryCap: "uint16"
      },
      key: ["player"],
    },
    Item: {
      schema: {
        player: "address",
        createdAt: "uint256",
        item_id: "uint256",
        amount: "uint256",
      },
      key: ["player", "item_id"],
    }
  },
  systems: {
    GameSystem: {
      name: "GameSystem",
      openAccess: true
    }
  }
});
