// SPDX-License-Identifier: BSD-2-Clause
pragma solidity ^0.8.0;

contract GiftCoin {
  // keep track of all the addresses that have coins
  mapping (address => uint) coins;
  // keep track of who the owner of this contract is
	address public owner;

  constructor() {
    // When this coin is initially deployed, we'll set that account to be the user
    // msg is a globally available variable that will tell us information about this current contract call
    // https://solidity.readthedocs.io/en/develop/units-and-global-variables.html
    owner = msg.sender;
  }

  // This is an event we'll broadcast when a gift is successfully sent from one account to another
  event GiftSent(
      address from,
      address to,
      uint amount
  );

  function sendGift(address receiver, uint amount) public {
    require(coins[msg.sender] > 0);
    coins[msg.sender] -= amount;
    coins[receiver] += amount;
    // TODO: We need to take coins from the account that sent this and gift them to the reciever address
    // only if the account that sent this has sufficient funds
    // If successful we'll broadcast the GiftSent event
  }

  // this function will create new coins and should be reserved for only the owner to call it
  function mintCoins(address target, uint256 mintedAmount) onlyOwner public {
		coins[target] += mintedAmount;
	}

	modifier onlyOwner {
    // TODO: Update this line to require that the owner be the one calling the contract
		require(msg.sender == owner);
     // The _ is a placeholder for the body of the modified method
    _;
	}

  // returns the balance of the address in question
  function balanceOf(address addr) public view returns(uint) {
    return coins[addr];
  }
}

// TESTES

/**
const { loadFixture } = require("@nomicfoundation/hardhat-network-helpers");
const { assert } = require("chai");

describe('GiftCoin', function() {
  async function deployFixture() {
    const accounts = await ethers.getSigners();
    const Contract = await ethers.getContractFactory("GiftCoin");
    const contract = await Contract.deploy();
    await contract.deployed();
    return { accounts, contract };
  }

  it("should start an account with 0 coins", async function() {
    const { accounts, contract } = await loadFixture(deployFixture);
    const balance = await contract.balanceOf(accounts[0].address);
    assert.equal(balance.valueOf(), 0, "addresses should initially have zero coins");
  });

  it("should allow the owner to minting and gifting from the owner", async function() {
    const { accounts, contract } = await loadFixture(deployFixture);
    const owner = accounts[0];

    await contract.mintCoins(owner.address, 100);
    let ownerBalance = await contract.balanceOf(owner.address);
    assert.equal(ownerBalance.valueOf(), 100);

    await contract.connect(owner).sendGift(accounts[1].address, 5);
    ownerBalance = await contract.balanceOf(owner.address);
    assert.equal(ownerBalance.valueOf(), 95);
    let otherBalance = await contract.balanceOf(accounts[1].address);
    assert.equal(otherBalance.valueOf(), 5);
  });
});
*/
