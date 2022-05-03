//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

contract Bank {
    mapping (address => uint) private balances;
    address public owner;

    /// @notice constructor是payable，所以它可以得到30的初始资金。
    constructor() payable {
        // 设置owner为该合约的创建者
        owner = msg.sender;
    }

    modifier onlyOwner () {
        require(msg.sender == owner, 'not owner');
        _; // 函数修改器修饰函数时，函数体被插入到 “_;”
    }

    // 普通用户在bank中注册，注册就送10ether
    function enroll () public returns (uint) {
        balances[msg.sender] = 10 ether;

        return balances[msg.sender];
    }

    /// @notice 转账给bank合约ether
    function deposit() public payable returns (uint) {
        balances[msg.sender] += msg.value;

        return balances[msg.sender];
    }

    /// @notice 从bank中提取ether
    function withdraw(uint withdrawAmount) public onlyOwner {
        payable(owner).transfer(withdrawAmount);
    }

    /// @notice 只是读取要求的账户余额，所以是 "常数"
    function balance() public view returns (uint) {
        return balances[msg.sender];
    }

    /// @return 返回bank账户的余额
    function depositsBalance() public view returns (uint) {
        return address(this).balance;
    }

    fallback() external payable {
        balances[msg.sender] += msg.value;
    }
    
    receive() external payable {}

}
