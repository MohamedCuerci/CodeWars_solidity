// SPDX-License-Identifier: BSD-2-Clause

pragma solidity ^0.8.10;

contract Repeater {
  function multiply(uint8 repeat, string memory pattern) public pure returns (string memory) {
    bytes memory bpattern = bytes(pattern);
    uint resultLength = repeat * bpattern.length;
    string memory result = new string(resultLength);
    bytes memory bresult = bytes(result);
    for (uint i = 0; i < resultLength; i++) {
        bresult[i] = bpattern[i % bpattern.length];
    }
    return string(bresult);
  }
}


//TESTES

/**

 */
