// SPDX-License-Identifier: MIT

// Layout of Contract:
// version
// imports
// interfaces, libraries, contracts
// errors
// Type declarations
// State variables
// Events
// Modifiers
// Functions

// Layout of Functions:
// constructor
// receive function (if exists)
// fallback function (if exists)
// external
// public
// internal
// private
// view & pure functions

pragma solidity ^0.8.28;

import {ERC20Burnable, ERC20} from "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";
import {Ownable} from "@openzeppelin/contracts/access/Ownable.sol";

/**
 * @title Decentralized Stable Coin
 * @author Sumit Mazumdar
 * Collateral: Exogenous (ETH & BTC)
 * Minting: Algorithmic
 * Relative Stability: Pegged to USD
 *
 * This is the contract meant to be governed by DSCEngine. This contract is just
 * the ERC20 implementationof our stable coin system.
 */
contract DecentralizedStableCoin is ERC20Burnable, Ownable {
    error DecentralisedStableCoin__MustBeMoreThanZero();
    error DecentralisedStableCoin__BurnAmountExceedsBalance();
    error DecentralisedStableCoin__NotZeroAddress();

    constructor() ERC20("Decentralised StableCoin", "DSC") Ownable(msg.sender) {}

    /**
     * @notice Burns DSC tokens from the owner's balance.
     * @dev Overrides the `burn` function from ERC20Burnable. 
     *      Validates that `_amount` is greater than zero and 
     *      does not exceed the caller's balance before burning.
     * @param _amount The amount of tokens to burn (must be greater than zero).
     */
    function burn(uint256 _amount) public override onlyOwner {
        uint256 balance = balanceOf(msg.sender);

        if (_amount <= 0) {
            revert DecentralisedStableCoin__MustBeMoreThanZero();
        }

        if (balance < _amount) {
            revert DecentralisedStableCoin__BurnAmountExceedsBalance();
        }

        super.burn(_amount);
    }

    /**
     * @notice Mints new DSC tokens to a specified address.
     * @dev Only callable by the contract owner. Uses OpenZeppelin's internal `_mint` function.
     * @param _to The address that will receive the newly minted tokens.
     * @param _amount The amount of tokens to mint (must be greater than zero).
     * @return A boolean indicating whether the minting succeeded.
     */
    function mint(address _to, uint256 _amount) external onlyOwner returns (bool) {
        if (_to == address(0)) {
            revert DecentralisedStableCoin__NotZeroAddress();
        }

        if (_amount < 0) {
            revert DecentralisedStableCoin__MustBeMoreThanZero();
        }

        _mint(_to, _amount);

        return true;
    }
}
