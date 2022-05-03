//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

contract TestEvent {
    constructor() {}

    event Deposit(address _from, uint _value);

    function deposit(uint value) public {
        emit Deposit(msg.sender, value);
    }
}