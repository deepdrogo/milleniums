// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import "./ITRC20.sol";

/**
 * @title Standard TRC20 token
 * @dev Implements the core TRC20 functionality using Solidity 0.8 built-in overflow checks.
 */
contract TRC20 is ITRC20 {
    mapping(address => uint256) private _balances;
    mapping(address => mapping(address => uint256)) private _allowances;
    uint256 private _totalSupply;

    /**
     * @dev Returns the total supply.
     */
    function totalSupply() public view override returns (uint256) {
        return _totalSupply;
    }

    /**
     * @dev Returns the balance of the given account.
     */
    function balanceOf(address account) public view override returns (uint256) {
        return _balances[account];
    }

    /**
     * @dev Returns the remaining allowance for a spender.
     */
    function allowance(address owner, address spender) public view override returns (uint256) {
        return _allowances[owner][spender];
    }

    /**
     * @dev Transfers tokens to `to`.
     */
    function transfer(address to, uint256 value) public override returns (bool) {
        _transfer(msg.sender, to, value);
        return true;
    }

    /**
     * @dev Approves `spender` to spend `value` tokens.
     */
    function approve(address spender, uint256 value) public override returns (bool) {
        _approve(msg.sender, spender, value);
        return true;
    }

    /**
     * @dev Transfers `value` tokens from `from` to `to` using the allowance mechanism.
     */
    function transferFrom(address from, address to, uint256 value) public override returns (bool) {
        _spendAllowance(from, msg.sender, value);
        _transfer(from, to, value);
        return true;
    }

    /**
     * @dev Increases allowance.
     */
    function increaseAllowance(address spender, uint256 addedValue) public returns (bool) {
        _approve(msg.sender, spender, _allowances[msg.sender][spender] + addedValue);
        return true;
    }

    /**
     * @dev Decreases allowance.
     */
    function decreaseAllowance(address spender, uint256 subtractedValue) public returns (bool) {
        uint256 currentAllowance = _allowances[msg.sender][spender];
        require(currentAllowance >= subtractedValue, "TRC20: decreased allowance below zero");
        unchecked {
            _approve(msg.sender, spender, currentAllowance - subtractedValue);
        }
        return true;
    }

    /**
     * @dev Internal transfer logic.
     */
    function _transfer(address from, address to, uint256 value) internal virtual {
        require(from != address(0), "TRC20: transfer from the zero address");
        require(to != address(0), "TRC20: transfer to the zero address");

        uint256 fromBalance = _balances[from];
        require(fromBalance >= value, "TRC20: transfer amount exceeds balance");
        unchecked {
            _balances[from] = fromBalance - value;
        }
        _balances[to] += value;

        emit Transfer(from, to, value);
    }

    /**
     * @dev Creates `value` tokens for `account`.
     */
    function _mint(address account, uint256 value) internal virtual {
        require(account != address(0), "TRC20: mint to the zero address");

        _totalSupply += value;
        _balances[account] += value;
        emit Transfer(address(0), account, value);
    }

    /**
     * @dev Destroys `value` tokens from `account`.
     */
    function _burn(address account, uint256 value) internal virtual {
        require(account != address(0), "TRC20: burn from the zero address");

        uint256 accountBalance = _balances[account];
        require(accountBalance >= value, "TRC20: burn amount exceeds balance");
        unchecked {
            _balances[account] = accountBalance - value;
            _totalSupply -= value;
        }

        emit Transfer(account, address(0), value);
    }

    /**
     * @dev Sets allowance.
     */
    function _approve(address owner, address spender, uint256 value) internal virtual {
        require(owner != address(0), "TRC20: approve from the zero address");
        require(spender != address(0), "TRC20: approve to the zero address");

        _allowances[owner][spender] = value;
        emit Approval(owner, spender, value);
    }

    /**
     * @dev Spend allowance helper.
     */
    function _spendAllowance(address owner, address spender, uint256 value) internal virtual {
        uint256 currentAllowance = _allowances[owner][spender];
        require(currentAllowance >= value, "TRC20: insufficient allowance");
        unchecked {
            _allowances[owner][spender] = currentAllowance - value;
        }
    }
}
