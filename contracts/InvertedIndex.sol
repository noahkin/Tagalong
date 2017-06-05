pragma solidity ^0.4.11;

contract InvertedIndex {
    address private owner;
    mapping (bytes32 => address[]) idx;


    function InvertedIndex() {
        owner = msg.sender;
    }


    function addEntry() returns (bool) {

    }
}
