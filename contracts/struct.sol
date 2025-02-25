// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract ProductContract {
    struct Product {
        uint id;
        string name;
        uint price;
        uint stock;
    }

    mapping(uint => Product) public products;

    uint public productCount = 0;

    function addProduct(
        uint _id,
        string memory _name,
        uint _price,
        uint _stock
    ) public {
        productCount++;
        products[productCount] = Product(_id, _name, _price, _stock);
    }

    function updateProductStock(uint _productId, uint _newStock) public {
        Product storage product = products[_productId];
        product.stock = _newStock;
    }

    function getProduct(
        uint _productId
    ) public view returns (string memory, uint, uint) {
        Product storage product = products[_productId];
        return (product.name, product.price, product.stock);
    }
}

contract OrderContract {
    struct Order {
        uint id;
        uint productId;
        uint quantity;
        uint totalPrice;
    }

    mapping(uint => Order) public orders;

    uint public orderCount = 0;

    function addOrder(
        uint _productId,
        uint _quantity,
        uint _totalPrice
    ) public {
        orderCount++;
        orders[orderCount] = Order(
            orderCount,
            _productId,
            _quantity,
            _totalPrice
        );
    }
}

contract UserContract {
    struct User {
        uint id;
        string name;
        uint age;
        uint[] orderIds;
    }

    mapping(uint => User) public users;

    uint public userCount = 0;

    function addUser(uint _id, string memory _name, uint _age) public {
        userCount++;
        users[userCount] = User(_id, _name, _age, new uint[](0));
    }
}
