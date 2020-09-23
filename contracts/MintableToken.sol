// SPDX-License-Identifier: MIT
pragma solidity >=0.5.0 <0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/ERC20Detailed.sol";
import "@openzeppelin/contracts/token/ERC20/ERC20Mintable.sol";
import "@openzeppelin/contracts/token/ERC20/ERC20Pausable.sol";

contract MintableToken is ERC20, ERC20Detailed, ERC20Mintable, ERC20Pausable {
    constructor(string memory  tokenName, string memory  tokensymbol) 
    ERC20Detailed(tokenName, tokensymbol, 18) public {}

    function mint(address account, uint256 amount) public whenNotPaused returns (bool) {
        return super.mint(account, amount);
    }
}