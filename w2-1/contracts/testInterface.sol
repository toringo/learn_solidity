//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

contract Counter {
    uint public count;
    constructor() {
        count = 0;
    }

    function increment() external {
        count += 1;
    }
}

interface ICounter {
    function count() external view returns (uint);
    function increment() external;
}


contract MyCounter {
    function incrementCounter(address _counter) external {
        ICounter(_counter).increment();
    }

    function getCount(address _counter) external view returns (uint) {
        return ICounter(_counter).count();
    }
}