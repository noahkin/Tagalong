pragma solidity ^0.4.12;

contract InvertedIndex {
    address private owner;

    function InvertedIndex() {
        owner = msg.sender;
    }
}
