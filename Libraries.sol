pragma solidity ^0.6.0;
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/math/SafeMath.sol";

contract Libraries {
    
    using SafeMath for uint; 
    
    mapping (address => uint) public tokenBalance; 
    
    constructor () public {
        tokenBalance[msg.sender] = 1;
    }
    
    function sendToken(address payable _to, uint _amount) public returns (bool) {
        tokenBalance[msg.sender] = tokenBalance[msg.sender].sub(_amount);
        tokenBalance[_to] = tokenBalance[_to].add(_amount); 
        
        return true;
    }
}