// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract ValueType {

    // 布尔类型
    bool public isActive = true;

    function toggleActive() public {
        isActive = !isActive;
    }

    // 整型, -2^7 ~ 2^7 - 1
    int8 signedInt = 10;

    uint8 uInt = 32;

    // 模拟定长浮点型
    int256 fixPoint = 1e18;

    // 定长字节数据
    bytes1 sigleByte = 0x12;

    // 有理数和整型常量
    uint256 integer = 1234;
    // 表示 1.5 以太
    uint256 rationalLitecal = 1.5 * 1e18;

    // 字符串常量, 不可变的文本数据
    string greeting = "hello";

    // 枚举
    enum Status {Pending, Shipped}

    Status public currentStatus;

    // 函数类型 存储和传递函数的引用
    function setStatus(Status _status) public {
        currentStatus = _status;
    }

    // 地址类型，存储以太坊地址，特殊类型，20字符长度
    address owner = msg.sender;

    // 地址常量
    address constant fixedAddress = 0x8df197edAf4C297e22B777fd2DDA04254B3C0a84;
}