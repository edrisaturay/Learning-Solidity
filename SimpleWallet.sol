pragma solidity ^0.6.0;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/access/Ownable.sol"; 
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/math/SafeMath.sol"; 

contract SimpleWallet is Ownable{
    
    using SafeMath for uint; 
    
    mapping( address => uint ) public allowance; 
    uint tokenPrice = 1 ether;
    
    
    function addAllowance(address _who, uint _amount) public onlyOwner {
        _amount = _amount.mul(tokenPrice); 
        allowance[_who] = _amount; 
    }
    
    modifier ownerOrAllowed(uint _amount) {
        _amount = _amount.mul(tokenPrice); 
        require(owner() == msg.sender || allowance[msg.sender] >= _amount, "You're not allowed");
        _;
    }
    
    function withdrawMoney(address payable _to, uint _amount) public ownerOrAllowed(_amount) {
        _amount = _amount.mul(tokenPrice); 
        _to.transfer(_amount);
    }
    
    receive () external payable {
        
    }
}