// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;


contract IntegerExample {

    int8 a = -1;
    int16 b = 2;
    uint32 c = 10;
    uint8 d = 16;

    function add(uint x, uint y) public pure returns (uint z) {
        z = x + y;
    }

    function divide(uint x, uint y) public pure returns (uint z) {
        z = x / y;
    }

    function leftshift(int x, uint y) public pure returns (int z) {
        z = x << y;
    }

    function rightshift(int x, uint y) public pure returns (int z) {
        z = x >> y;
    }

    function testPlusPlus() public pure returns (uint) {
        uint x = 1;
        uint y = ++x;
        return y;
    }
}


contract TestOverflow {
    function add1() public pure returns (uint8) {
        // 整数溢出，uint8的最大值255
        uint8 x = 128;
        uint8 y = x * 2;
        return y;
    }

    function add2() public pure returns (uint8) {
        // 整数溢出，uint8最大值255
        uint8 i = 240;
        uint8 j = 16;
        uint8 k = i + j;
    }

    function sub1() public pure returns (uint8) {
        // 溢出
        uint8 m = 1;
        uint8 n = m - 2;
        return n;
    }

    function add(uint256 a, uint256 b) internal pure returns (uint256) {
        // 低版本的solidity需要进行越界检查
        uint256 c = a + b;
        require(c >= a);
        return c;
    }
}