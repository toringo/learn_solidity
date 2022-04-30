require("@nomiclabs/hardhat-waffle");
task("counter", "Prints count of counter").setAction(async (taskArgs, hre) => {
  const counter = await hre.ethers.getContractAt("Counter", taskArgs.address);
  await counter.increment();
  const count = await counter.getCount();
  console.log("count====>", count);
});

