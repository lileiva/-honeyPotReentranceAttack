pragma solidity ^0.4.8;
/**
check this post https://medium.com/@gus_tavo_guim/reentrancy-attack-on-smart-contracts-how-to-identify-the-exploitable-and-an-example-of-an-attack-4470a2d8dfe4
 */

contract HoneyPot {
  mapping (address => uint) public balances;
  function HoneyPot() payable {
    put();
  }
  function put() payable {
    balances[msg.sender] = msg.value;
  }
  function get() {
    if (!msg.sender.call.value(balances[msg.sender])()) {
      throw;
    }
      balances[msg.sender] = 0;
  }
  function() {
    throw;
  }
}