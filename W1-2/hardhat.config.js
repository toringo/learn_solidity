require("@nomiclabs/hardhat-waffle");

// This is a sample Hardhat task. To learn how to create your own go to
// https://hardhat.org/guides/create-task.html
task("accounts", "Prints the list of accounts", async (taskArgs, hre) => {
  const accounts = await hre.ethers.getSigners();

  for (const account of accounts) {
    console.log(account.address);
  }
});

require("@nomiclabs/hardhat-web3");

task("balance", "Prints an account's balance")
  .addParam("account", "The account's address")
  .setAction(async (taskArgs) => {
    const account = web3.utils.toChecksumAddress(taskArgs.account);
    const balance = await web3.eth.getBalance(account);

    console.log(balance, web3.utils.fromWei(balance, "ether"), "ETH");
  });

task("hello", "Prints a greeting'")
  .addOptionalParam("greeting", "The greeting to print", "Hello, World!")
  // .setAction(async ({ greeting }) => console.log(greeting))
  .setAction(async () => {
    await run("print", { message: "subtask, Hello, World!" });
  });


subtask("print", "Prints a message")
      .addParam("message", "The message to print")
      .setAction(async (taskArgs) => {
        console.log(taskArgs.message);
      });

// You need to export an object to set up your config
// Go to https://hardhat.org/config/ to learn more

/**
 * @type import('hardhat/config').HardhatUserConfig
 */
module.exports = {
  defaultNetwork: "OKCTest",
  networks: {
    OKCTest: {
      url: "https://exchaintestrpc.okex.org",
      accounts: [
        "522d1fb702020445e850b39948e9ecf4a62001745983e217faec367d4e769da1",
      ],
      chainId: 65,
    },
  },
  solidity: "0.8.4",
};
