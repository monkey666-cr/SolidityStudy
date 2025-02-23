// SPDX-License-Identifier: MIT 
pragma solidity ^0.8.24;

contract DataHandling {
    // 存储在storage中的动态数组
    uint[] public data;

    function updateData(uint[] memory newData) public {
        // 从memory到storage的赋值，创建了独立的拷贝
        data = newData;
    }

    function getData() public view returns (uint[] memory) {
        // 从storage到memory的赋值, 创建了独立的拷贝
        return data;
    }

    function modifyStorageData(uint index, uint value) public {
        require(index < data.length, "Index out of bounds");
        // 修改storage中的值，开销较大
        data[index] = value;
    }

    function modifyMemoryData(
        uint[] memory array
    ) public pure returns (uint[] memory) {
        if (array.length > 0) {
            // 修改memory中的值，开销较小
            array[0] = 999;
        }

        return array;
    }
}
