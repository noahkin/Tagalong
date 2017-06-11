pragma solidity ^0.4.11;

contract AddressTags {
    address private owner;
    mapping(address => Tag[]) tags; // maps each address to the tags that address has been tagged with


    function AddressTags() {
        owner = msg.sender;
    }


    struct Tag {
        bytes32 tag;
        uint weight;
        address[] taggedBy;
    }


    function addTag(address _address, bytes32 _tag) returns (bool) {
        // Check if tag already exists, if so then add weight
        bool found = false;
        // Iterate through all tags
        for (uint i = 0; i < tags[_address].length; i++) {
            if (tags[_address][i].tag == _tag) {
                // Check if sender address already added this tag
                for (uint j = 0; j < tags[_address][i].taggedBy.length; j++) {
                    if (tags[_address][i].taggedBy[j] == msg.sender) {
                        return false; // or something
                    }
                }
                tags[_address][i].weight += 1;
                tags[_address][i].taggedBy.push(msg.sender);
                found = true;
                break;
            }
        }
        // If tag not found, add a new tag
        if (found == false) {
            Tag memory newTag;
            newTag.tag = _tag;
            newTag.weight = 1;
            newTag.taggedBy[0] = (msg.sender);
            tags[_address].push(newTag);
        }
        return true;
    }


    function getTags(address _address) constant returns (bytes32[] tagValues, uint[] tagWeights) {
        for (uint i = 0; i < tags[_address].length; i++) {
            tagValues[i] = (tags[_address][i].tag);
            tagWeights[i] = (tags[_address][i].weight);
        }
    }
}
