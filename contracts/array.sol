// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract ArrayExample {
    uint256[] public data;

    function add(uint256 _data) public {
        data.push(_data);
    }

    function get(uint256 _index) public view returns (uint256) {
        return data[_index];
    }

    function getLength() public view returns (uint256) {
        return data.length;
    }

    function calSum(uint256[] memory _data) public pure returns (uint256) {
        uint256 sum = 0;

        for (uint256 i = 0; i < _data.length; i++) {
            sum += _data[i];
        }

        return sum;
    }

    function remove(uint256 _index) public {
        require(_index < data.length, "Index out of range");

        for (uint256 i = _index; i < data.length - 1; i++) {
            data[i] = data[i + 1];
        }

        data.pop();
    }

}
