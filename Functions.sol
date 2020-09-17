pragma solidity ^0.5.13; 
 
contract Functions {
    
    uint decimals = 1000000000000000000; 
    
    mapping (address => uint) public balanceReceived;
    
    address payable owner; 
    
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
    
    // Fallback Function 
    function () external payable {
        receiveMoney();
    }
    
    // constructor
    constructor () public {
        owner = msg.sender; 
    }
    
    function destroySmartContract() public {
        if(msg.sender != owner){
            revert("You're not the owner, cannot destroy the smart contract"); 
        }else{
            selfdestruct(owner);
        }
    }
    
    function getOwner () public view returns(address) {
        return owner; 
    }
    
    function convertWeiToEther(uint _amountInWei) public pure returns (uint) {
        return (_amountInWei * 1000000000000000000); 
    }
}