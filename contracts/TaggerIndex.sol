pragma solidity ^0.4.11;

contract TaggerIndex {
    address private owner;
    mapping(address => bytes32[]) tags; // maps each address to the set of tags they have tagged


    function TaggerIndex() {
        owner = msg.sender;
    }


    function addEntry(address _address, bytes32 _tag) returns (bool) {
        for (uint i = 0; i < tags[_address].length; i++)
            if (tags[_address][i] == _tag)
                return false;
        tags[_address].push(_tag);
        return true;
    }
}
