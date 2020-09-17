pragma solidity ^0.5.13; 

contract Events {
    uint tokenPrice = 1 ether;
    
    mapping (address => uint) public tokenBalance; 
    
    event TokensSent(address _from, address _to, uint _amount);
    
    constructor () public{
        tokenBalance[msg.sender] = 100 * tokenPrice;
    }
    
    function sendToken(address payable _to, uint _amount) public payable returns (bool) { 
        
        require(tokenBalance[msg.sender] >= _amount, "You don't have enough funds to perform this transaction");
        assert(tokenBalance[_to] + _amount >= tokenBalance[_to]);
        assert(tokenBalance[msg.sender] - _amount <= tokenBalance[msg.sender]); 
        tokenBalance[msg.sender] -= _amount; 
        tokenBalance[_to] += _amount;
        
        emit TokensSent(msg.sender, _to, _amount); 
        
        return true;
    }
}