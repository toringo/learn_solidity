// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;

contract Count {
  uint public count = 0;
  address public owner;

  function increment() public returns (uint) {
    count += 1;

    return count;
  }

  function getCount() public view returns (uint) {
    return count;
  }
}
 