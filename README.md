<div align="center">

<img src=".github/logo.png" alt="Milleniums Logo" width="200"/>

# 🌟 Milleniums (MLM)

![Solidity](https://img.shields.io/badge/Solidity-0.8.25-363636?style=for-the-badge&logo=solidity)
![TRON](https://img.shields.io/badge/TRON-TRC20-FF0013?style=for-the-badge&logo=tron)
![License](https://img.shields.io/badge/License-MIT-green?style=for-the-badge)

**A premium TRC20 token built for the next era of digital finance**

[Documentation](#-documentation) • [Deployment](#-deployment) • [Security](#-security)

</div>

---

## 📋 Overview

**Milleniums (MLM)** is an elite digital asset designed to symbolize timeless progress, precision, and innovation. Built on the TRON blockchain using Solidity 0.8.25, it combines modern security standards with flexible minting capabilities.

### ✨ Key Features

- 🔐 **Secure** - Built with latest Solidity standards (0.8.25)
- 💎 **Premium** - 18 decimals for maximum precision
- 🚀 **Optimized** - Gas-efficient implementation
- 🔄 **Transferable Ownership** - Flexible control management

---

## 🔧 Token Specifications

| Property | Value |
|----------|-------|
| **Name** | Milleniums |
| **Symbol** | MLM |
| **Decimals** | 18 |
| **Initial Supply** | 1,000 MLM |
| **Max Supply** | Unlimited (mintable) |
| **Standard** | TRC20 |
| **Compiler** | Solidity 0.8.25 |

---

## 📁 Project Structure

```
TRC20/
├── ITRC20.sol              # TRC20 interface definition
├── TRC20.sol               # Core TRC20 implementation
├── TRC20Detailed.sol       # Token metadata (name, symbol, decimals)
├── Token.sol               # Milleniums main contract
└── SafeMath.sol            # Legacy math library (optional)
```

---

## 🚀 Deployment

### Prerequisites
- TRON wallet with sufficient TRX for deployment
- Solidity compiler 0.8.25
- TronLink or compatible wallet

### Compilation Settings
```json
{
  "compiler": "0.8.25",
  "optimization": "Enabled",
  "runs": 200,
  "viaIR": false
}
```

### Deploy Steps

1. **Compile Contract**
   - Use Solidity 0.8.25
   - Enable optimization
   - Set runs to 200
   - ViaIR: No

2. **Deploy Token.sol**
   - Constructor automatically mints 1,000 MLM to deployer
   - Save contract address for verification

3. **Verify on Tronscan**
   - Upload all 5 contract files
   - Use same compiler settings
   - Select "Token" as main contract

---

## 🔒 Security

### Owner Functions

```solidity
// Mint new tokens (owner only)
function mint(address to, uint256 amount) public onlyOwner

// Transfer ownership (owner only)
function transferOwnership(address newOwner) public onlyOwner
```

### Security Best Practices

✅ **Do:**
- Store owner private key in hardware wallet
- Verify contract source on Tronscan after deployment
- Double-check mint amounts (use 18 decimals)
- Consider multisig for production deployments

❌ **Don't:**
- Share private keys
- Mint without verifying recipient address
- Deploy without testing on testnet first

---

## 💡 Usage Examples

### Minting Tokens

To mint **1,000 MLM** tokens:

```javascript
// Amount must be in smallest units (10^18)
amount = 1000 * (10 ** 18)
// = 1000000000000000000000

contract.mint(recipientAddress, amount)
```

### Checking Balance

```javascript
balance = contract.balanceOf(address)
// Returns balance in smallest units
// Divide by 10^18 to get MLM amount
```

### Transferring Ownership

```javascript
contract.transferOwnership(newOwnerAddress)
```

---

## 🔍 Contract Addresses

### Mainnet
> 🚧 Coming soon - Deploy your contract and add address here

### Testnet (Shasta)
> 🚧 Coming soon - Deploy your contract and add address here

---

## 📚 Documentation

### Standard TRC20 Functions

| Function | Description |
|----------|-------------|
| `balanceOf(address)` | Get token balance of address |
| `transfer(address, uint256)` | Transfer tokens to address |
| `approve(address, uint256)` | Approve spender allowance |
| `transferFrom(address, address, uint256)` | Transfer from approved address |
| `allowance(address, address)` | Check approved allowance |
| `totalSupply()` | Get total token supply |

### Custom Functions

| Function | Description | Access |
|----------|-------------|--------|
| `mint(address, uint256)` | Mint new tokens | Owner only |
| `transferOwnership(address)` | Transfer contract ownership | Owner only |

---

## 🧪 Testing

```bash
# Deploy to Shasta testnet first
1. Get testnet TRX from faucet
2. Deploy contract
3. Test all functions
4. Verify contract source
5. Deploy to mainnet
```

---

## 🤝 Contributing

Contributions are welcome! Please feel free to submit issues or pull requests.

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

---

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

## ⚠️ Disclaimer

This token is provided as-is. Always conduct your own research and audit before using in production. The developers are not responsible for any losses incurred.

---

## 🔗 Links

- [TRON Documentation](https://developers.tron.network/)
- [TRC20 Standard](https://github.com/tronprotocol/tips/blob/master/tip-20.md)
- [Tronscan](https://tronscan.org/)

---

<div align="center">

**Built with ❤️ for the TRON ecosystem**

⭐ Star this repo if you find it useful!

</div>
