//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

import "hardhat/console.sol";


contract Score2 {
  address public teacher;
  mapping (address => Student) scores;

  struct Student {
    address student;
    uint score;
  }

  constructor() {
    // teacher = msg.sender;
  }

  function setTeacher(address account) external {
    console.log("setTeacher", account);
    teacher = account;
  }

  modifier onlyTeacher () {
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
    // require(score < 100, 'score not than 100');
    
    Student memory scoreMemory = scores[account];
    scoreMemory.score = score;
    scores[account] = scoreMemory;
  }

  function getScore(address account) external view returns (uint) {
    return scores[account].score;
  }
}

interface IScore2 {
  function modifierScore(address account, uint score) external;
  function setTeacher(address account) external;
  function getScore(address account) external view returns (uint);
}

contract Teacher {
  IScore2 score;
  address owner;
  
  constructor(address account) payable {
    score = IScore2(account); 
    owner = msg.sender;
    score.setTeacher(address(this));
  }

  modifier onlyOwner(){
    require(msg.sender == owner);
    _;
  }
  function changeScore(address account, uint _score) public onlyOwner {
    score.modifierScore(account, _score);
  }

  function getScore2(address account) view public returns (uint) {
    return score.getScore(account);
  }
}