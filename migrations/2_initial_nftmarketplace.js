const NFTMarketplace = artifacts.require("NFtMarketPlace.sol");

module.exports = function (deployer) {
  deployer.deploy(NFTMarketplace);
};
