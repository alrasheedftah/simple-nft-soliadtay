// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

import "./interfaces/ERC721Interface.sol";

contract ERC721 is ERC721Interface{

    // map to store tokenOwners 
    mapping(uint256 => address ) private _tokenOwners;

    // Maping To Save How Oner Owned Amount Of Token
    mapping(address => uint256) private _tokenOwnerOwned;


    //Create Event Take Address to And From And TokenId and set all param indexed to be searchable 
    // event Transfare(address indexed from ,address indexed to ,uint256 indexed tokenId);

    // This Metode Make The Token NFT And Send Or Assign To Ownder  // add the Virual Cuz I Want To Override This Method
    function _mint(address to, uint256 tokenId) internal virtual{

        // Firstly I Need To Check The Valid Address Not equals The the address(0) 
        require(to !=  address(0) , "Sorry Cannot Mint To Address 0 ");

        // also i need to the tokenId Actioly Is Created Not Duplicated
        require(!_tokenExsits(tokenId), " Sorry Token Already Minted");

        // shold have list to store all tokenid To That Owner
        _tokenOwners[tokenId] = to ;// this means tokenOwners = { 12334221 =>  0xaaayewh766w7jw87w7uk }
        
        // after add i need to increment the token count 
        _tokenOwnerOwned[to] += 1; 


        // After Transfare And Minted I Need To Emit Evevnt And Pass it the to address and tokenId 
        emit Transfare(address(0), to, tokenId);
     }


     function _tokenExsits(uint256 tokenId) internal view returns(bool){
           address owner = _tokenOwners[tokenId];

           return owner != address(0); 
     }


     // Know How Token For Owner Address

     function balanceOf(address _owner) external view override returns (uint256){
        //validation The Address Not Equals Address(0)
        require(_owner != address(0)," Wrong Address Or Not Available" );


        // return The TokenId 
        return _tokenOwnerOwned[_owner];
     }

     // get Owner For Current TokenId 
     function ownerOf(uint256 _tokenId) external view override returns(address){
        address _owner = _tokenOwners[_tokenId];
        require(_owner != address(0)," Wrong Address Or Not Available" );
        // get Address For The Current TokenId 
        return _owner;
     }  
}