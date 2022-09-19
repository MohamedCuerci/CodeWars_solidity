// SPDX-License-Identifier: BSD-2-Clause

pragma solidity ^0.8.16;

contract HelloWorld {
  // State Variables
  string greeting = "Hello World!"; // Change this

  // Endpoints
  function greet() public view returns(string memory){
    return greeting;
  }

  function setGreeting(string memory word) public {
    greeting = word;
  }
}

//TESTES

/***
 const { loadFixture } = require("@nomicfoundation/hardhat-network-helpers");
const { assert } = require("chai");

describe('HelloWorld', function() {
  async function deployFixture() {
    const Contract = await ethers.getContractFactory("HelloWorld");
    const contract = await Contract.deploy();
    await contract.deployed();
    return contract;
  };

  it("greet endpoint should return greeting", async () => {
    const d = await loadFixture(deployFixture);
    assert.equal(await d.greet(), "Hello World!");
  });

  it("setGreeting endpoint should change greeting to Bonjour!", async () => {
    const d = await loadFixture(deployFixture);
    await d.setGreeting("Bonjour!");
    assert.equal(await d.greet(), "Bonjour!");
  });

  it("setGreeting endpoint should change greeting to Howdy!", async () => {
    const d = await loadFixture(deployFixture);
    await d.setGreeting("Howdy!");
    assert.equal(await d.greet(), "Howdy!");
  });
});
 */
