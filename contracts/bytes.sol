// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BytesAndStringArray {
    // 用于存储 bytes 数组
    bytes[] public bytesArray;
    
    // 用于存储 string 数组
    string[] public stringArray;

    // 添加 bytes 到数组
    function addBytes(bytes memory _data) public {
        bytesArray.push(_data);
    }

    // 添加 string 到数组
    function addString(string memory _data) public {
        stringArray.push(_data);
    }

    // 获取 bytes 数组的长度
    function getBytesArrayLength() public view returns (uint) {
        return bytesArray.length;
    }

    // 获取 string 数组的长度
    function getStringArrayLength() public view returns (uint) {
        return stringArray.length;
    }

    // 获取特定索引的 bytes 数据
    function getBytesAtIndex(uint _index) public view returns (bytes memory) {
        require(_index < bytesArray.length, "Index out of bounds");
        return bytesArray[_index];
    }

    // 获取特定索引的 string 数据
    function getStringAtIndex(uint _index) public view returns (string memory) {
        require(_index < stringArray.length, "Index out of bounds");
        return stringArray[_index];
    }

    // 将 bytes 转换为 string
    function bytesToString(bytes memory _data) public pure returns (string memory) {
        return string(_data);
    }

    // 将 string 转换为 bytes
    function stringToBytes(string memory _data) public pure returns (bytes memory) {
        return bytes(_data);
    }

    // 获取 bytes 的长度
    function getBytesLength(bytes memory _data) public pure returns (uint) {
        return _data.length;
    }

    // 获取 string 的长度
    function getStringLength(string memory _data) public pure returns (uint) {
        return bytes(_data).length;
    }
}