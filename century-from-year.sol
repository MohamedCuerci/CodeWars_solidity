// SPDX-License-Identifier: BSD-2-Clause
pragma solidity ^0.8.6;

contract Kata {
  function century(int year) public pure returns (int) {
    // your code here
    //if (year % 100 == 0){
    //  return (year / 100);
    //}
    //return (year / 100) + 1;
    return (year + 99) / 100;
  }
}

//TESTES

/**
const { loadFixture } = require("@nomicfoundation/hardhat-network-helpers");
const { assert } = require("chai");

describe('Century from year', function() {
  async function deployFixture() {
    const Contract = await ethers.getContractFactory("Kata");
    const contract = await Contract.deploy();
    await contract.deployed();
    return contract;
  };
  it("basic tests", async function() {
    const d = await loadFixture(deployFixture);
    assert.equal((await d.century(1705)).valueOf(), 18);
    assert.equal((await d.century(1900)).valueOf(), 19);
    assert.equal((await d.century(1601)).valueOf(), 17);
    assert.equal((await d.century(2000)).valueOf(), 20);
    assert.equal((await d.century(89)).valueOf(), 1);
  });
});
 */
