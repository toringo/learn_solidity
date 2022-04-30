const { expect } = require("chai");
const { ethers } = require("hardhat");

describe("Counter", function () {
  it("Should return the new counter once it's changed", async function () {
    const Counter = await ethers.getContractFactory("Counter");
    const counter = await Counter.deploy();
    await counter.deployed();

    expect(await counter.getCount()).to.equal(0);

    const setCountTx = await counter.setCount(88);

    // wait until the transaction is mined
    await setCountTx.wait();

    expect(await counter.getCount()).to.equal(88);
  });

  it("counter increment", async function () {
    const Counter = await ethers.getContractFactory("Counter");
    const counter = await Counter.deploy();
    await counter.deployed();

    expect(await counter.getCount()).to.equal(0);

    const incrementCountTx = await counter.increment();

    await incrementCountTx.wait();
    expect(await counter.getCount()).to.equal(1);
  });
});
