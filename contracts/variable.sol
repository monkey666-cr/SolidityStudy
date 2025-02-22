// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Variable {
    // 状态变量
    uint storageData;

    constructor() public {
        storageData = 10;
    }

    function getResult() public view returns (uint) {
        // 局部变量
        uint a = 1;
        uint b = 2;
        uint result = a + b;
        
        // 访问局部变量
        return result;
    }
}