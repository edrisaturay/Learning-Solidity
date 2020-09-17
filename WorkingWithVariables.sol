pragma solidity ^0.5.13;

contract WorkingWithVariables {
    
    // Boolean
    bool public myBool; 
    
    function setMyBool(bool _myBool) public {
        myBool = _myBool;
    }
    
    // Integers
    
    uint8 public myUint8; 
    
    function incrementUint8() public {
        myUint8++;
    }
    
    function decrementUint8() public {
        myUint8--;
    }
    
    uint256 public myUnit; 
    
    function setMyUint(uint _myUint) public {
        myUnit = _myUint;
    }
    
    // Address
    
    address public myAddress; 
    
    function setAddress(address _address) public {
        myAddress = _address;
    }
    
    function getBalanceOfAddress() public view returns (uint) {
        return myAddress.balance;
    }
    
    
    // string
    
    string public myString = 'Hello World'; 
    
    function setMyString(string memory _myString) public {
        myString = _myString;
    }
}