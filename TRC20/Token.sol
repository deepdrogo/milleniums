// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import "./TRC20Detailed.sol";

/**
 * @title Mandatory Token
 * @dev TRC20 Token implementation with minting capability.
 */
contract Token is TRC20Detailed {
    uint8 private constant TOKEN_DECIMALS = 18;
    uint256 private constant INITIAL_SUPPLY = 1_000 * 10 ** TOKEN_DECIMALS;

    address public owner;

    event Mint(address indexed to, uint256 amount);
    event OwnershipTransferred(address indexed previousOwner, address indexed newOwner);

    modifier onlyOwner() {
        require(msg.sender == owner, "Caller is not the owner");
        _;
    }

    constructor() TRC20Detailed("Milleniums", "MLM", TOKEN_DECIMALS) {
        owner = msg.sender;
        emit OwnershipTransferred(address(0), msg.sender);
        _mint(msg.sender, INITIAL_SUPPLY);
    }

    /**
     * @dev Mint new tokens. Amount must be specified in the smallest unit (10^18).
     */
    function mint(address to, uint256 amount) external onlyOwner returns (bool) {
        require(to != address(0), "Mint to zero address");
        require(amount > 0, "Mint amount must be greater than zero");

        _mint(to, amount);
        emit Mint(to, amount);
        return true;
    }

    /**
     * @dev Transfer ownership to a new account.
     */
    function transferOwnership(address newOwner) external onlyOwner {
        require(newOwner != address(0), "New owner is zero address");
        emit OwnershipTransferred(owner, newOwner);
        owner = newOwner;
    }
}
