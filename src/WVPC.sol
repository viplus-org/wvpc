// SPDX-License-Identifier: MIT
// Compatible with OpenZeppelin Contracts ^5.0.0
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Pausable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Permit.sol";

contract WrappedViplusCoin is
    ERC20,
    ERC20Burnable,
    ERC20Pausable,
    Ownable,
    ERC20Permit
{
    constructor(
        address initialOwner,
        address liquitorAddress,
        address devAddress,
        address marketingAddress,
        address airdropAddress,
        address philantropicAddress,
        address platformAddress
    )
        ERC20("Wrapped Viplus Coin", "WVPC")
        Ownable(initialOwner)
        ERC20Permit("Wrapped Viplus Coin")
    {
        uint256 constantCirculationAmount = 200000000 ether;

        _mint(liquitorAddress, (constantCirculationAmount * 45) / 100);
        _mint(devAddress, (constantCirculationAmount * 10) / 100);
        _mint(marketingAddress, (constantCirculationAmount * 10) / 100);
        _mint(airdropAddress, (constantCirculationAmount * 25) / 100);
        _mint(philantropicAddress, (constantCirculationAmount * 5) / 100);
        _mint(platformAddress, (constantCirculationAmount * 5) / 100);
    }

    function pause() public onlyOwner {
        _pause();
    }

    function unpause() public onlyOwner {
        _unpause();
    }

    // The following functions are overrides required by Solidity.

    function _update(
        address from,
        address to,
        uint256 value
    ) internal override(ERC20, ERC20Pausable) {
        super._update(from, to, value);
    }
}