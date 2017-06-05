pragma solidity ^0.4.11;

contract TaggerIndex {
    address private owner;
    mapping(address => Tag[]) tags;


    function TaggerIndex() {
        owner = msg.sender;
    }


    struct Tag {
        bytes32 tag;
        uint weight;
    }


    function addEntry() returns (bool) {

    }
}
