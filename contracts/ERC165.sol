
// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

import "./interfaces/IERC165.sol";


contract ERC165 is IERC165{
    // define maping for all interface id 
    mapping (bytes4 => bool) private _supportID;

    constructor(){
        _registerInterface(bytes4(keccak256('supportsInterface(bytes4)')));
    }


    function supportsInterface(bytes4 interfaceID) public view override returns (bool){
        return _supportID[interfaceID];
    }

    function _registerInterface(bytes4 interfaceID) internal {
        //  i can use By Passing InterfaceId To This Method And Check If Equals The 0xffffffff then add by next lin e 
        require(interfaceID != 0xffffffff , "Invalid InterfaceID" );
        _supportID[interfaceID] = true;  // same 
        
        // or Use This Line 
        // _supportID[this.supportsInterface.selector] = true;
    }    

}
