// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

import "./ERC721.sol";

contract ERC721Enumrable is ERC721{
   
   uint256 [] private _allTokens;

    // Override For The _mint Function Tha in ERC721 as mean Should add ovverid And Mention The Parrent Class 
    function _mint(address to,uint256 tokenId) internal override(ERC721){
        // call The _mint in  Parent Class ERC721     
        super._mint(to,tokenId);

        // Increase and Add This TokenId To  The TotalSupplay By Call This Method
        _addTokenToTotalSupplay(tokenId);
    } 

    function _addTokenToTotalSupplay(uint256 tokenId) private{
        // push it  in array
        _allTokens.push(tokenId);
    }

//    / define function that return the number of mints NFT  
   function getTotalSupplay() external view returns(uint256){
    return _allTokens.length;
   }

}