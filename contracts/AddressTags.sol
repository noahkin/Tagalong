pragma solidity ^0.4.12;

contract AddressTags {
    address private owner;
    mapping(address => Tag[]) tags;
    indexEntry[] private invertedIndex;


    function AddressTags() {
        owner = msg.sender;
    }


    struct Tag {
        bytes32 tag;
        uint weight;
        address[] taggedBy;
    }


    struct indexEntry {
        bytes32 tag;
        matchAndWeight[] matches;
    }


    struct matchAndWeight {
        address match;
        uint weight;
    }


    function addTag(address _address, bytes32 _tag) returns (bool) {
        // Check if tag already exists, if so then add weight
        bool found = false;
        // Iterate through all tags
        for (uint i = 0; i < tags[_address].length; i++)
            if (tags[_address][i].tag == _tag) {
                // Check if sender address already added this tag
                for (uint j = 0; j < tags[_address].taggedBy.length; j++) {
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
            newTag.taggedBy.push(msg.sender);
            tags[_address].push(newTag);
        }
        return true;
    }


    function getTags(address _address) returns Tag[] {
        return tags[_address];
    }


    function private addToInvertedIndex(Tag _tag) returns (bool) {
        return false;
    }


    function private incrementInvertedIndexWeight(Tag _tag) returns (bool) {
        for (uint i = 0; i < invertedIndex.length; i++) {
            return false;
        }
    }
}
