
pragma solidity ^0.4.8;

contract PrivateBank
{
    mapping (address => uint) public balances;
    address public adr = this;
    uint public MinDeposit = 1 ether;
    
    Log TransferLog;
    
    function PrivateBank(address _log)
    {
        TransferLog = Log(_log);
    }
    
    function Deposit()
    public
    payable
    {
        if(msg.value > MinDeposit)
        {
            balances[msg.sender]+=msg.value;
        }
    }
    
    function CashOut()
    public
    payable
    {
        if(0 < balances[msg.sender])
        {
            
            if(msg.sender.call.value(balances[msg.sender])())
            {
                balances[msg.sender]=0;
                TransferLog.AddMessage(msg.sender,balances[msg.sender],"CashOut");
            }
        }
    }
    
    function() public payable{}    
    
}

contract Log 
{
    address public owner;
    function Log(){
        owner = msg.sender;
    }
    struct Message
    {
        address Sender;
        string  Data;
        uint Val;
        uint  Time;
    }
    address public adr = this;
    Message[] public History;
    
    Message LastMsg;
    
    function AddMessage(address _adr,uint _val,string _data)
    public
    {
        LastMsg.Sender = _adr;
        LastMsg.Time = now;
        LastMsg.Val = _val;
        LastMsg.Data = _data;
        History.push(LastMsg);
    }
}