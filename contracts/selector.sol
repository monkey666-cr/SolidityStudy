// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract FunctionSelectorExample {
    bytes4 public storedSelector;

    function square(uint256 num) external pure returns (uint256) {
        return num * num;
    }

    function double(uint256 num) external pure returns (uint256) {
        return num * 2;
    }

    function getSelectorSquare() external pure returns (bytes4) {
        return this.square.selector;
    }

    function getSelectorDouble() external pure returns (bytes4) {
        return this.double.selector;
    }

    function getSelectorSquare2() external pure returns (bytes4) {
        return bytes4(keccak256("square(uint256)"));
    }

    function getSelectorDouble2() external pure returns (bytes4) {
        return bytes4(keccak256("double(uint256)"));
    }

    function execute(bytes4 _selector, uint256 num) external returns (uint256) {
        (bool success, bytes memory data) = address(this).call(
            abi.encodeWithSelector(_selector, num)
        );
        require(success, "Call failed");
        uint256 z = abi.decode(data, (uint256));
        return z;
    }

    function setSelector(bytes4 _selector) public {
        storedSelector = _selector;
    }

    function executeSelector(uint256 num) external returns (uint256) {
        require(storedSelector != bytes4(0), "Selector not set");
        return this.execute(storedSelector, num);
    }
}
