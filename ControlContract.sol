pragma solidity ^ 0.5.13; 

contract ControlContract {
    
    address owner; 
    bool public paused; 
    constructor() public {
        owner = msg.sender; 
    }
    
    function sendMoney() public payable {
        
    }
    
    
    function setPaused(bool _paused) public {
        require (msg.sender == owner, "You're not the owner, cannot paused"); 
        paused = _paused;
    }
    
    function withdrawMoney (address payable _to) public {
        require (msg.sender  == owner, "You're not the owner");
        require (paused, "Contract is paused");
        _to.transfer(address(this).balance);
    }
    
    function destroySmartContract(address payable _to) public {
        require (msg.sender == owner, "Cannot destroy, You're not the owner");
        selfdestruct(_to);
    }
}