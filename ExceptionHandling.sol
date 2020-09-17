pragma solidity ^0.5.13; 

contract ExceptionHandling {
    
    uint decimals = 1000000000000000000; 
    
    mapping (address => uint) public balanceReceived;
    
    function receiveMoney () public payable {
        assert(balanceReceived[msg.sender] + msg.value >= balanceReceived[msg.sender]);
        balanceReceived[msg.sender] += msg.value;
    }
    
    function withdrawMoney(address payable _to, uint _amount) public {
        require(balanceReceived[msg.sender] >= (_amount * decimals), "You don't have enough funds");
        assert(balanceReceived[msg.sender] >= balanceReceived[msg.sender] - (_amount * decimals));
        balanceReceived[msg.sender] += (_amount * decimals); 
        _to.transfer(_amount * decimals); 
    }
}