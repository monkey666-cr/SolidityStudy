// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract Car {
    function speed() public pure returns (uint) {
        return 100;
    }

    function drive() public pure returns (string memory) {
        return "Drive";
    }
}

contract electriccar is Car {
    uint public batteryLevel;

    function charge() public {
        batteryLevel = 100;
    }
}

contract Person {
    function name() public pure virtual returns (string memory) {
        return "Person";
    }
}

contract Employee {
    function work() public pure returns (string memory) {
        return "Work";
    }
}

contract Manager is Employee, Person {
    function name() public pure override returns (string memory) {
        return "Manager";
    }
}

abstract contract Shape {
    function area() public view virtual returns (uint);
}

contract Square is Shape {
    uint256 private side;

    constructor(uint256 _side) {
        side = _side;
    }

    function area() public view override returns (uint) {
        return side * side;
    }
}

contract Circle is Shape {
    uint256 private radius;

    constructor(uint256 _radius) {
        radius = _radius;
    }

    function area() public view override returns (uint) {
        return (314159 * radius * radius) / 10000;
    }
}
