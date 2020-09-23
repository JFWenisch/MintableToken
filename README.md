# MintableToken

## Prerequesites
Init npm if it's not already initialized
```
npm init -y
```

Install truffle globally if it's not already installed

```
npm install -g truffle
```

Verify that truffle is installed

```
D:\Git\MintableToken>truffle v
```

```
...
Truffle v5.1.45 (core: 5.1.45)
Solidity v0.5.16 (solc-js)
Node v10.16.3
Web3.js v1.2.1
```

For the deployment we will use then openzeppelin-cli. To install it run
```
npm install @openzeppelin/cli
```

Finally run npm update within the workdir

```
npm update
```

## Deployment

### Deploying to local (Ganache) Network
For testing local deployments we are using Ganache. To install it run
```
npm install -g ganache-cli
```

Start Ganache process
```
ganache-cli
```

Identify that the process is running by seeing the automatically created wallets and private keys and having the "Listening on Listening on 127.0.0.1:8545" line at the end
```
Available Accounts
==================
(0) 0x7d7210183413A552A3e7a98Cb5964b49A75Ec516 (100 ETH)
(1) 0x3E8F58d35Df5A85FF87D40AF1ae8a37e7b66e0Ed (100 ETH)
(2) 0x27aeAcDE8E88a423dfd608A1B00ACafEB1255Dda (100 ETH)
(3) 0x0A2abe070c412A86fe2BBED187DcFB1F27C0DE5D (100 ETH)
(4) 0x478753Cb5F9268017AF3e3cD58C01553B1BA132E (100 ETH)
(5) 0x603d90eB3617502b6C4b1616Dd0A6195C035b886 (100 ETH)
(6) 0xba384070D8c72E3ADA7EE3bbEa80A38eD895258d (100 ETH)
(7) 0xd5CAa8bda6c237355510f82FeFBf43eC818C6F82 (100 ETH)
(8) 0x03Dd2c31a3E209A4B730Fb79Ef63FC3Aca4123c7 (100 ETH)
(9) 0xe4359D94ed8f5a2984C15504Ca577Ed38d6fe0FF (100 ETH)

Private Keys
==================
(0) 0x3441734e70e09530a9136698ce4be76a00b4ca52a52c1de1d19e8e95fe9e2caa
(1) 0x4c00d73cb4ffab9598b469a96f9f49440e75eb05714ed90a20dab636cfb46464
(2) 0xc60160b983886827a1c0840f2712534daff2b100a8fdbf460ed22faf66c67ec1
(3) 0x377f98ffb4db0eca11765e3ad9643ff949becefe6bcbd37dfe8a69cc0db59b0c
(4) 0xc27465453f2d56124997e10c801aab00a73d2875567de2e9a530826aac2dfd89
(5) 0x33c2d4f51a1ec0f9a3051f300cc0dc6bd78506019525221456cba64b5e965124
(6) 0x19df39b664f2d064d4835be0a1d83925b1863281e2da2d8b87818c1f29e81fa0
(7) 0xc90fe69981dcc7b5ceccb1513e3f5dd44a50c80faf189a4bd066f36aa382caed
(8) 0x804148c323abe5ec9a80ad89403e9b5b006b62d1ec6b2799eaa2c34554cc1c87
(9) 0xfcacdbfc5226c707901aaea9c3973521ac864420c59700e79d48fe02980c7a25

HD Wallet
==================
Mnemonic:      sketch calm trouble brass fit casino film sort push layer hat bleak
Base HD Path:  m/44'/60'/0'/0/{account_index}

Gas Price
==================
20000000000

Gas Limit
==================
6721975

Call Gas Limit
==================
9007199254740991

Listening on 127.0.0.1:8545
```

Once the ganache process is up and running, open up a new console and deploy the contract
```
npx oz deploy
```

The contracts will be automatically compiled

```
✓ Compiling contracts with Truffle, using settings from truffle.js file
Truffle output:

Compiling your contracts...
===========================
> Compiling @openzeppelin/contracts/token/ERC20/ERC20.sol
> Compiling @openzeppelin/contracts/token/ERC20/ERC20Detailed.sol
> Compiling @openzeppelin/contracts/token/ERC20/ERC20Mintable.sol
> Compiling @openzeppelin/contracts/token/ERC20/ERC20Pausable.sol
> Compiling @openzeppelin\contracts\GSN\Context.sol
> Compiling @openzeppelin\contracts\access\Roles.sol
> Compiling @openzeppelin\contracts\access\roles\MinterRole.sol
> Compiling @openzeppelin\contracts\access\roles\PauserRole.sol
> Compiling @openzeppelin\contracts\lifecycle\Pausable.sol
> Compiling @openzeppelin\contracts\math\SafeMath.sol
> Compiling @openzeppelin\contracts\token\ERC20\ERC20.sol
> Compiling @openzeppelin\contracts\token\ERC20\IERC20.sol
> Compiling .\contracts\MintableToken.sol
> Artifacts written to D:\Git\MintableToken\build\contracts
> Compiled successfully using:
   - solc: 0.5.16+commit.9c3226ce.Emscripten.clang
...
```
The openzeppeling cli will help you choosing the desired network and input the for the constructor required arguments

```
? Choose the kind of deployment regular
? Pick a network local
? Pick a contract to deploy MintableToken
? tokenName: string: JFWenisch Development
? tokensymbol: string: JFW
✓ Deployed instance of MintableToken
0xd2d970b0FDD3BE8296dC790131c0dc06868ADD46
```

### Deploying to public Networks
In order to be able to deploy to one of the public networks we will need to sign all transactions locally.
@truffle/hdwallet-provider is embedded to do this,but we will need to create a file "secrets.json"

```
{
  "mnemonic": "pioneer tent curve wild ...",
  "projectId": "305c13705054a8d918ad77549e402c72"
}
```

This file inherits your mnemonic and and the infura projectid which is required to deploy the contracts the desired public network.
So you will need to register an account at https://infura.io/register and create a new project. Afterwards you will find your projectid within the projects settings page.

After you've created the secrets.json run npx oz deploy and follow the wizard through the setup steps and choose your desired network

```
PS D:\Git\MintableToken> npx oz deploy
✓ Compiling contracts with Truffle, using settings from truffle.js file
Truffle output:

Compiling your contracts...
===========================
> Compiling @openzeppelin/contracts/token/ERC20/ERC20.sol
> Compiling @openzeppelin/contracts/token/ERC20/ERC20Detailed.sol
> Compiling @openzeppelin/contracts/token/ERC20/ERC20Mintable.sol
> Compiling @openzeppelin/contracts/token/ERC20/ERC20Pausable.sol
> Compiling @openzeppelin\contracts\GSN\Context.sol
> Compiling @openzeppelin\contracts\access\Roles.sol
> Compiling @openzeppelin\contracts\access\roles\MinterRole.sol
> Compiling @openzeppelin\contracts\access\roles\PauserRole.sol
> Compiling @openzeppelin\contracts\lifecycle\Pausable.sol
> Compiling @openzeppelin\contracts\math\SafeMath.sol
> Compiling @openzeppelin\contracts\token\ERC20\ERC20.sol
> Compiling @openzeppelin\contracts\token\ERC20\IERC20.sol
> Compiling .\contracts\MintableToken.sol
> Artifacts written to D:\Git\MintableToken\build\contracts
> Compiled successfully using:
   - solc: 0.5.16+commit.9c3226ce.Emscripten.clang


? Choose the kind of deployment regular
? Pick a network ropsten
? Pick a contract to deploy MintableToken
? tokenName: string: JFWenisch Development 001
? tokensymbol: string: JFW001
✓ Deployed instance of MintableToken
0x1c3a44e2Be51D523c87B71622039DAd6715E9Eed
```