pragma solidity 0.5.13;


contract Owned {
    address owner; 
    constructor () public {
        owner = msg.sender; 
    }
    
    modifier onlyOwner() {
        
        require(msg.sender == owner, "You're not allowed"); 
        _;
    }
}