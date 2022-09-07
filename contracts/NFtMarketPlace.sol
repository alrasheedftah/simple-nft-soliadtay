// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

import "./ERC721Metadata.sol";
import "./ERC721Enumrable.sol" ; 

contract NFtMarketPlace is ERC721Metadata ,ERC721Enumrable{

    // declare List That Hold All My NFTs
    string [] nftLists ;

    // maping to check if metatdata exeists or not 
    mapping(string => bool ) _nftsMetadataExsits;

    string public decsription  = "MyNFT Marketplace To Upload Some Images ";


    constructor () ERC721Metadata("MyNftMarketplace","Test"){

    }

    function mint(string memory metadataUrl) public{

        // firstly check the metadata exsits or not 
        require(!_nftsMetadataExsits[metadataUrl],"Sorry MetaData Nefts Url  ALready Exsists  ");

        // stor metadata in nftslists   
        nftLists.push(metadataUrl);
        // get The Counter From Length -1 
        uint id = nftLists.length - 1;

        // change The Status Or Add The MetaData True To Add  TODO this Step Should Be After The _mint Function 
        _nftsMetadataExsits[metadataUrl] = true;

        _mint(msg.sender, id );
    }
}