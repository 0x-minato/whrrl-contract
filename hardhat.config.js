require("@nomicfoundation/hardhat-toolbox");

/** @type import('hardhat/config').HardhatUserConfig */
module.exports = {
  solidity: "0.8.24",
  networks:{
    sepolia: {
      url: `https://eth-sepolia.g.alchemy.com/v2/GskgZhGeFvv2vCxF9G5Pfs71GAAGeZ5L`,
      accounts: ["a7c8c498dda51a8b19678e216011e73dbfc241a29f55463ed404a329f6921a1f"]
    },
  }
};
