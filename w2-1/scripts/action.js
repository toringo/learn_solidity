const { ethers } = require("hardhat");

async  function main() {
  let [owner, second] = await ethers.getSigners();

  let TestEvent = await ethers.getContractAt(
    "TestEvent",
    "0x5325408178985897fc82C86511433DC9BECDb891",
    owner
  );

  await TestEvent.deposit(10);
}

main().then(() => process.exit(0));