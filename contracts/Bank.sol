// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract Bank {
    // 状态变量
    address immutable owner;

    // 存钱
    event Deposit(address _ads, uint256 _amount);
    // 提取
    event Withdraw(address _ads);

    receive() external payable {
        emit Deposit(msg.sender, msg.value);
    }

    constructor() {
        owner = msg.sender;
    }

    function getBalance() external view returns (uint256) {
        return address(this).balance;
    }

    function withdraw(address _ads) external payable {
        require(owner == msg.sender, "Not OWner");
        emit Withdraw(_ads);
        // selfdestruct(payable(msg.sender));
        (bool success,) = payable(msg.sender).call{value: address(this).balance}("");
        require(success && msg.value == 0, "Withdrawl failed");
    }
}