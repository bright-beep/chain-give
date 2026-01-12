# ChainGive - Decentralized Philanthropy Platform

![Stacks](https://img.shields.io/badge/Stacks-663399?style=for-the-badge&logo=stacks&logoColor=white)

![License](https://img.shields.io/badge/License-ISC-green?style=for-the-badge)

A revolutionary blockchain-powered philanthropic ecosystem that eliminates intermediaries between donors and causes. Built on Stacks, ChainGive transforms charitable giving through immutable transparency, automated milestone tracking, and democratic fund governance.

## 🚀 Overview

ChainGive revolutionizes the philanthropic landscape by creating a trustless environment where every donation is tracked, every fund utilization is verified, and every impact is measurable. Our platform empowers donors with unprecedented visibility into their contributions while providing causes with streamlined access to global funding.

### ✨ Key Features

- **Zero-Trust Donation Infrastructure** - Immutable audit trails for every transaction
- **Multi-Tier Governance System** - Ensuring proper fund oversight with role-based permissions
- **Automated Milestone-Based Fund Release** - Smart contract-controlled fund distribution
- **Real-Time Impact Tracking** - Performance analytics for all stakeholders
- **Democratic Approval Workflows** - Maximum accountability through community governance
- **Global Accessibility** - Minimal transaction costs with worldwide reach

## 🏗️ Architecture

### Smart Contract Components

#### Role-Based Access Control

```clarity
ROLE-ADMIN (u1)        - Full platform administration rights
ROLE-MODERATOR (u2)    - Beneficiary registration and oversight
ROLE-BENEFICIARY (u3)  - Fund utilization and milestone management
```

#### Core Data Structures

- **Beneficiaries Registry** - Comprehensive tracking of charitable causes
- **Donation Ledger** - Complete transaction history with donor transparency
- **Utilization Tracking** - Milestone-based fund usage with approval workflows
- **Role Management** - Hierarchical permission system

#### Fund Flow Process

1. **Registration** - Beneficiaries register with verified credentials
2. **Donation** - Donors contribute directly to specific causes
3. **Milestone Tracking** - Fund utilization proposals with detailed descriptions
4. **Democratic Approval** - Community-driven approval for fund releases
5. **Impact Verification** - Real-time tracking of charitable impact

## 🛠️ Development Setup

### Prerequisites

- [Clarinet](https://github.com/hirosystems/clarinet) v2.0+
- [Node.js](https://nodejs.org/) v18+
- [Git](https://git-scm.com/)

### Installation

1. **Clone the repository**

```bash
git clone https://github.com/bright-beep/chain-give.git
cd chain-give
```

2. **Install dependencies**

```bash
npm install
```

3. **Initialize Clarinet environment**

```bash
clarinet check
```

### Project Structure

```
chain-give/
├── contracts/
│   └── chain-give.clar          # Main smart contract
├── tests/
│   └── chain-give.test.ts       # Unit tests
├── settings/
│   ├── Devnet.toml             # Development configuration
│   ├── Testnet.toml            # Testnet configuration
│   └── Mainnet.toml            # Mainnet configuration
├── Clarinet.toml               # Project configuration
├── package.json                # Node.js dependencies
└── README.md                   # This file
```

## 🧪 Testing

### Run Unit Tests

```bash
npm test
```

### Run Tests with Coverage

```bash
npm run test:report
```

### Watch Mode for Development

```bash
npm run test:watch
```

### Contract Validation

```bash
clarinet check
```

## 📚 Smart Contract API

### Public Functions

#### Role Management

```clarity
(set-role (user principal) (new-role uint))
(remove-role (user principal))
```

#### Beneficiary Management

```clarity
(register-beneficiary (name (string-utf8 50)) (description (string-utf8 255)) (target-amount uint))
(get-beneficiary (id uint))
```

#### Donation Processing

```clarity
(donate (beneficiary-id uint) (amount uint))
(get-donation-by-id (donation-id uint))
(get-donation-count)
```

#### Fund Utilization

```clarity
(add-utilization (beneficiary-id uint) (description (string-utf8 255)) (amount uint))
(approve-utilization (beneficiary-id uint) (milestone uint))
(get-utilization-by-id (utilization-id uint))
(get-utilization-count)
```

### Read-Only Functions

All getter functions are read-only and don't require transaction fees:

- `get-beneficiary`
- `get-donation-by-id`
- `get-donation-count`
- `get-utilization-by-id`
- `get-utilization-count`

## 🔒 Security Features

### Authorization Controls

- **Owner-Only Functions** - Critical operations restricted to contract owner
- **Role-Based Permissions** - Hierarchical access control system
- **Self-Modification Prevention** - Users cannot modify their own roles

### Fund Safety

- **Insufficient Funds Protection** - Automatic validation before fund releases
- **Milestone Validation** - Sequential approval process for fund utilization
- **Immutable Audit Trail** - All transactions permanently recorded on blockchain

### Error Handling

```clarity
ERR-NOT-AUTHORIZED (u100)        - Unauthorized access attempt
ERR-ALREADY-REGISTERED (u101)    - Duplicate registration prevention
ERR-NOT-FOUND (u102)            - Resource not found
ERR-INSUFFICIENT-FUNDS (u103)    - Insufficient balance for operation
ERR-BENEFICIARY-NOT-FOUND (u104) - Invalid beneficiary reference
ERR-UTILIZATION-NOT-FOUND (u105) - Invalid utilization reference
ERR-INVALID-INPUT (u106)         - Input validation failure
```

## 🚀 Deployment

### Local Development

```bash
clarinet integrate
```

### Testnet Deployment

```bash
clarinet deployments generate --testnet
clarinet deployments apply --testnet
```

### Mainnet Deployment

```bash
clarinet deployments generate --mainnet
clarinet deployments apply --mainnet
```

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

### Development Guidelines

- Follow Clarity best practices
- Maintain comprehensive test coverage
- Update documentation for new features
- Ensure all tests pass before submitting PR

## 📖 Documentation

- [Stacks Documentation](https://docs.stacks.co/)
- [Clarity Language Reference](https://docs.stacks.co/clarity/)
- [Clarinet Documentation](https://docs.hiro.so/stacks/clarinet)

## 🔗 Links

- **Website**: [Coming Soon]
- **Documentation**: [Coming Soon]
- **Discord**: [Coming Soon]
- **Twitter**: [Coming Soon]

## 📄 License

This project is licensed under the ISC License - see the [LICENSE](LICENSE) file for details.

## 🙏 Acknowledgments

- Built on [Stacks](https://www.stacks.co/) blockchain
- Powered by [Clarity](https://clarity-lang.org/) smart contracts
- Developed with [Clarinet](https://github.com/hirosystems/clarinet)

---

**The future of giving is transparent, efficient, and powered by blockchain.**

*ChainGive - Transforming philanthropy through decentralized innovation.*
