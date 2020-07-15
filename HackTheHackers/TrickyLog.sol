pragma solidity ^0.4.8;

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
        if(owner != _adr){
            throw;
        }
        
        LastMsg.Sender = _adr;
        LastMsg.Time = now;
        LastMsg.Val = _val;
        LastMsg.Data = _data;
        History.push(LastMsg);
    }
}