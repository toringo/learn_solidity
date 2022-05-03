//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

// contract A {
//   uint public a;
//   constructor() {
//     a = 1;
//   }
// }

// contract B is A {
//   uint public b;
//   constructor() {
//     b = 2;
//   }
// }
contract Counter {
    uint public count;
    constructor() {
        count = 0;
    }

    function increment() external {
        count += 1;
    }
}

contract MyCounter {
    function incrementCounter(address _counter) external {
        Counter(_counter).increment();
    }

    function getCount(address _counter) external view returns (uint) {
        return Counter(_counter).count();
    }
}