//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

import './Score4.sol';

interface IScore4 {
  function modifierScore(address account, uint score) external;
  function setTeacher(address account) external;
  function getScore(address account) external view returns (uint);
}

contract Teacher2 {
  address scoreContract;
  IScore4 score4;

  constructor(address account) {
    score4 = IScore4(account);

    score4.setTeacher(address(this));
  }

  function setScore(address _student, uint _score) external {
    score4.modifierScore(_student, _score);
  }
  
  function getScore(address _student) external view returns (uint) {
    return score4.getScore(_student);
  }
}