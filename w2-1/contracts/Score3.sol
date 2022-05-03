//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

import "hardhat/console.sol";

contract Score3 {
  address public teacher;
  mapping (address => Student) scores;

  struct Student {
    address student;
    uint score;
  }

  constructor() {
    teacher = msg.sender;
  }

  function setTeacher(address account) external {
    teacher = account;

    console.log('setTeacher', account);
  }

  modifier onlyTeacher () {
    console.log('onlyTeacher', teacher, msg.sender);
    require(msg.sender == teacher, 'not teacher, don`t change score');
    _; // 函数修改器修饰函数时，函数体被插入到 “_;”
  }

  modifier validScore(uint score) {
    require(score <= 100, 'Invalid score!');
    _;
  }

  modifier validAccount(address account) {
    require(scores[account].score <= 0, 'student score is exist!');
    _;
  }

  function addScore(address account, uint score) external validAccount(account) validScore(score) {
    scores[account] = Student(account, score);
  }

  function modifierScore(address account, uint score) onlyTeacher validScore(score) external {
    Student memory scoreMemory = scores[account];
    scoreMemory.score = score;
    scores[account] = scoreMemory;
  }

  function getScore(address account) external view returns (uint) {
    return scores[account].score;
  }
}
