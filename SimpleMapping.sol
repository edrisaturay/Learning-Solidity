pragma solidity ^0.5.13; 

contract SimpleMapping {
    // mapping (keyType => valueType) mappingName; 
    
    mapping (uint => bool ) public myMapping; 
    mapping (address => bool) public addressMapping; 
    
    // Set Values
    
    function setValue (uint _index) public {
        myMapping[_index] = true;
    }
    
    function setMyAddressToTrue() public {
        addressMapping[msg.sender] = true;
    }
}