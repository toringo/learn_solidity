//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

import './Score3.sol';

interface IScore3 {
  function modifierScore(address account, uint score) external;
  function setTeacher(address account) external;
  function getScore(address account) external view returns (uint);
}

contract Teacher {
  address public scoreAddress;
  Score3 score;

  constructor() {
    score = new Score3();
    scoreAddress = address(score);
  }

  function setScore(address _student, uint _score) external {
    score.modifierScore(_student, _score);
  }
  
  function getScore(address _student) external view returns (uint) {
    return score.getScore(_student);
  }
}