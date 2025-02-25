// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract MapExample {
    mapping(address => uint) public balances;

    function updateBalance(address _addr, uint _amount) public {
        balances[_addr] = _amount;
    }
}

contract MappingUser {
    MapExample public mapExample;

    constructor() {
        mapExample = new MapExample();
    }

    function updateBalance(address _addr, uint _amount) public {
        mapExample.updateBalance(_addr, _amount);
    }

    function getBalance(address _addr) public view returns (uint) {
        return mapExample.balances(_addr);
    }
}
