// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract Parent {
    
    function do_something() external pure returns (uint256) {
        return 123;
    }
}

contract Child is Parent {

    function hello() public view returns (uint256) {
        return this.do_something();
    }
}