// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract AddressExample {

    // 当前合约调用者的地址
    address myAddress = msg.sender;

    // 类型转换, payable修饰之后，代表当前地址允许支付
    address payable paayableAddress = payable(myAddress);

    function getMyAddress() public view returns (address) {
        return myAddress;
    }

    function myAddressDiffSender() public view returns (bool) {
        if (myAddress == msg.sender) {
            return true;
        } else {
            return false;
        }
    }

    // 获取当前地址的余额
    function getBalance() public view returns (uint256) {
        return myAddress.balance;
    }

    // transfer(): 将以太币转移到另一个地址，推荐使用这种方法
    function testTransfer() public payable {
        if (myAddress != msg.sender) {
            address payable recipient = payable(msg.sender);
            recipient.transfer(1 ether);
        }
    }

    // send(): 返回布尔值表示是否转义成功。由于没有回退机制不推荐使用
    function testSend() public payable {
        if (myAddress != msg.sender) {
            address payable recipient = payable(msg.sender);
            bool success = recipient.send(1 ether);
            require(success, "Transfer failed.");
        }
    }

    // call(): 低级别调用
    function testCaall() public payable {
        if (myAddress != msg.sender) {
            address payable recipient = payable(msg.sender);
            (bool success, ) = recipient.call{value: 1 ether}("");
            require(success, "Transfer failed.");
        }
    }

}


contract SimpleWallet {
    // 地址到余额的映射
    mapping(address => uint256) private balances;

    // 存钱功能
    function deposit() external payable {
        require(msg.value > 0, "Deposit amount must be greater than 0");
        balances[msg.sender] += msg.value;
    }

    // 提取功能
    function withdraw(uint256 amount) external {
        require(amount > 0, "Withdrawal amount must be greater than 0");
        require(balances[msg.sender] >= amount, "Insufficient balance");

        balances[msg.sender] -= amount;
        payable(msg.sender).transfer(amount);
    }

    // 余额查询功能
    function getBalance() external view returns (uint256) {
        return balances[msg.sender];
    }
}