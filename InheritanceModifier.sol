pragma solidity ^0.5.13; 

import './Owned.sol';


contract InheritanceModifier is Owned{
    
    mapping ( address => uint ) public tokenBalance; 
    
    
    uint tokenPrice = 1 ether;
    
    constructor () public {
        tokenBalance[owner] = 100; 
    }
    
    function createNewToken() public onlyOwner {
        uint currentBalance = tokenBalance[owner];
        tokenBalance[owner] ++; 
        assert(currentBalance < tokenBalance[owner]); 
    }
    
    function burnToken() public onlyOwner {
        tokenBalance[owner] --; 
    }
    
    function purchaseToken() public payable{
        if((tokenBalance[owner] * tokenPrice) / msg.value <= 0) {
            revert("not enough tokens"); 
        }else {
            tokenBalance[owner] -= msg.value / tokenPrice; 
            tokenBalance[msg.sender] += msg.value / tokenPrice; 
        }
    }
    
    function sendToken(address payable _to, uint _amount) public {
        require(tokenBalance[msg.sender] >= _amount, "You don't have enough funds to perform this transaction");
        assert(tokenBalance[_to] + _amount >= tokenBalance[_to]);
        assert(tokenBalance[msg.sender] - _amount <= tokenBalance[msg.sender]); 
        _to.transfer(_amount);
    }
}