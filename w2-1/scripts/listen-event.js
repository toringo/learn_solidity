const { ethers } = require("hardhat");

const filter = {
  address: "0x5325408178985897fc82C86511433DC9BECDb891",
  topics: [ethers.utils.id("Deposit(address,uint256)")],
};

ethers.provider.on(filter, (log) => {
  console.log(log);
});
