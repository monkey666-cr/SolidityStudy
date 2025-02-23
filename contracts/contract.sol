// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;


contract World {

}

contract Hello {
    function getAddress() public view returns (address) {
        return address(this);
    }

    function sayHi() public {

    }

    function destroyContract(address payable recipient) public {
        selfdestruct(recipient);
    }

    function getContractInfo() public pure returns (string memory, bytes memory, bytes memory) {
        return (type(World).name, type(World).creationCode, type(World).runtimeCode);
    }

    function isContract(address addr) public view returns (bool) {
        uint256 size;
        assembly { size := extcodesize(addr) }
        return size > 0;
    }
}