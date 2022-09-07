// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

import "./ERC721.sol";

contract ERC721Enumrable is ERC721{
   
   // Hold All Token And Represent The Total Supply
   uint256 [] private _allTokens;


   // define mapin That Hold All Owner With Token Represent any owner as index to refernce the token 
   mapping(address => uint256[]) private _ownedTokens; // token By Owner

   // also I Need To Define The Mpaing To Hold The OwnedToken Index
   mapping(uint256 => uint256) private _ownedTokenIndex;

   // add all token to represent or refrences by index 
   mapping(uint256 => uint256 ) private _allTokenByIndex;

    // Override For The _mint Function Tha in ERC721 as mean Should add ovverid And Mention The Parrent Class 
    function _mint(address to,uint256 tokenId) internal override(ERC721){
        // call The _mint in  Parent Class ERC721     
        super._mint(to,tokenId);

        // Increase and Add This TokenId To  The TotalSupplay By Call This Method
        _addTokenToTotalSupplay(tokenId);
        _addTokenToHisOwner(to, tokenId);
    } 

    function _addTokenToTotalSupplay(uint256 tokenId) private{
        // add token To AllTokenByIndex To Returned It By Index Anyway
        _allTokenByIndex[tokenId] = _allTokens.length;

        // push it  in array
        _allTokens.push(tokenId);
    }

//    / define function that return the number of mints NFT  
   function getTotalSupplay() external view returns(uint256){
    
    return _allTokens.length;
   }


   // get Token By Index 
   function getTokenByIndex(uint256 index) public view returns(uint256){

    return _allTokens[index];
   }


   function getTokenOfOwnerByIndex(address owner,uint256 index) public view returns(uint256){

        _ownedTokens[owner][index]; //  return like from this tokens array  [1,2,4,3]  returned 2 
   }

   function _addTokenToHisOwner(address to,uint256 tokenId) private{
    //add Token To OwnedTokenIndex To Represent Or When Need To Return By Index Of Token 
    _ownedTokenIndex[tokenId] = _ownedTokens[to].length;
    // add tokenId To His Owner to be like this ["0x address" => [1,2,3,4,5]]
    _ownedTokens[to].push(tokenId);
   }   

}