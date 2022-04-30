//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

import "hardhat/console.sol";

contract Counter {
  uint public count = 0;
  function increment() public returns (uint) {
    count += 1;

    return count;
  }

  function setCount(uint value) public returns (uint) {
    count = value;

    return count;
  }

  function getCount() public view returns (uint) {
    return count;
  }
}