pragma solidity ^0.4.11;

contract InvertedIndex {
    address private owner;
    mapping (bytes32 => address[]) idx; // maps each tag to the set of addresses that have been tagged with that tag


    function InvertedIndex() {
        owner = msg.sender;
    }


    function addEntry(address _address, bytes32 _tag) returns (bool) {
        for (uint i = 0; i < idx[_tag].length; i++)
            if (idx[_tag][i] == _address)
                return false;
            idx[_tag].push(_address);
    }
}
