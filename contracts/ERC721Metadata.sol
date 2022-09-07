// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

import "./interfaces/IERC721Metadata.sol";

contract ERC721Metadata is IERC721Metadata {
    string private _name ;

    string private _symbol;

    constructor(string memory newName,string memory newSymbol){
        _name = newName;
        _symbol = newSymbol; 
    }

    function name() external view  override returns (string memory){
        return _name;
    }

    function symbol() external view override returns (string memory){
        return _symbol;
    }    
} 