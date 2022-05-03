//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

contract Score {
  mapping (address => uint) private scores;
  address public owner;
  uint[] public numbers;
  constructor() payable {
      // 设置owner为该合约的创建者
      owner = msg.sender;
  }

  modifier onlyOwner () {
      require(msg.sender == owner, 'not owner');
      _; // 函数修改器修饰函数时，函数体被插入到 “_;”
  }

  function modifierScore(uint score) payable public onlyOwner {
    require(score < 100, 'score not than 100');
    scores[msg.sender] = score;
    numbers.push(score);
  }

  function getScore() public view returns (uint) {
    return scores[msg.sender];
  }

  function getNumber() public view returns (uint[] memory) {
    return numbers;
  }

}