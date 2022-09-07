// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

interface IERC721Enumrable {

   function getTotalSupplay() external view returns(uint256);

   function getTokenByIndex(uint256 index) external view returns(uint256);

   function getTokenOfOwnerByIndex(address owner,uint256 index) external view returns(uint256);


}