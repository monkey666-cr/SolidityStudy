// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract WETH {
    // ERC20标准状态变量
    string public name = "Wrapped ETH";
    string public symbol = "WETH";
    uint8 public decimals = 18;

    // 账户余额
    mapping(address => uint256) private _balance;
    // 第三方授权额度
    mapping(address => mapping(address => uint256)) private _allowances;
    // 总的供应量
    uint256 private _totalSupply;

    // 事件
    // 转账
    event Transfer(address indexed from, address indexed to, uint256 value);
    // 授权
    event Approval(
        address indexed owner,
        address indexed spender,
        uint256 value
    );
    // 存钱
    event Deposit(address indexed account, uint256 amount);
    // 取钱
    event Withdrawal(address indexed account, uint256 amount);

    function getBalance(address account) public view returns (uint256) {
        return _balance[account];
    }

    function allowance(address owner, address spender)
        public
        view
        returns (uint256)
    {
        return _allowances[owner][spender];
    }

    function totalSupply() public view returns (uint256) {
        return _totalSupply;
    }

    function transfer(address to, uint256 amount) public returns (bool) {
        require(_balance[msg.sender] >= amount, "ERC20: transfer amount exceeds balance");
        _balance[msg.sender] -= amount;
        _balance[to] += amount;
        emit Transfer(msg.sender, to, amount);
        return true;
    }

    // 第三方机构划转地址上的余额
    function transferFrom(address from, address to, uint256 amount) public returns (bool) {
        require(_balance[from] >= amount, "ERC20: transfer amount exceeds balance");
        require(_allowances[from][msg.sender] >= amount, "ERC20: transfer amount exceeds allowance");

        _balance[from] -= amount;
        _balance[to] += amount;
        _allowances[from][msg.sender] -= amount;

        emit Transfer(from, to, amount);
        
        return true;
    }

    // 授权
    function approve(address spender, uint256 amount) public returns (bool) {
        _allowances[msg.sender][spender] += amount;

        emit Approval(msg.sender, spender, amount);

        return true;
    }

    // WETH特有功能
    function deposit() public payable {
        require(msg.value > 0, "WETH: deposit amount must be greater than 0");
        _balance[msg.sender] += msg.value;
        _totalSupply += msg.value;

        emit Deposit(msg.sender, msg.value);
        emit Transfer(address(0), msg.sender, msg.value);
    }

    function withdraw(uint256 amount) public {
        require(_balance[msg.sender] > amount, "WETH: withdrawal amount exceeds balance");

        _balance[msg.sender] -= amount;
        _totalSupply -= amount;

        // 给账户赚钱
        payable(msg.sender).transfer(amount);

        emit Withdrawal(msg.sender, amount);
        emit Transfer(msg.sender, address(0), amount);
    }

        // 接收 ETH 的回退函数
    receive() external payable {
        deposit();
    }
}
