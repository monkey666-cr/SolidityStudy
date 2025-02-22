# Solidity基础

## 变量

- 状态变量：变量值永久存储到区块链的变量，合约的存储空间。
    ```solidity
    pragma solidity ^0.8.20;

    contract Variable {
        // 状态变量
        uint storageData;

        constructor() public {
            storageData = 10;
        }
    }
    ```
- 局部变量：仅在函数执行中有效，函数退出后变量无效。
    ```solidity
    pragma solidity ^0.8.20;

    contract Variable {

        function getResult() public view returns (uint) {
            // 局部变量
            uint a = 1;
            uint b = 2;
            uint result = a + b;
            
            // 访问局部变量
            return result;
        }
    }
    ```
- 全局变量：存在全局命名空间的变量，可以获取区块链的相关信息，比如，区块链高度。
    ```txt
    blockhash(uint blockNumber) returns (bytes32) 给定区块的哈希值 – 只适用于 256 最近区块, 不包含当前区块

    block.coinbase (address payable) 当前区块矿工的地址

    block.difficulty (uint) 当前区块的难度

    block.gaslimit (uint) 当前区块的 gaslimit

    block.number (uint) 当前区块的 number

    block.timestamp (uint) 当前区块的时间戳，为 unix 纪元以来的秒

    gasleft() returns (uint256) 剩余 gas

    msg.data (bytes calldata) 完成 calldata

    msg.sender (address payable) 消息发送者 (当前 caller)

    msg.sig (bytes4) calldata 的前四个字节 (function identifier)

    msg.value (uint) 当前消息的 wei 值

    now (uint) 当前块的时间戳

    tx.gasprice (uint) 交易的 gas 价格

    tx.origin (address payable) 交易的发送方
    ```

Solidity静态类型语言，意味着申请变量需要指定变量类型，每个变量声明的时候，都有一个基于类型的默认值。

