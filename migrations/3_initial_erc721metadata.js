const ERC721Metadata = artifacts.require("ERC721Metadata.sol");

module.exports = function (deployer) {
  deployer.deploy(ERC721Metadata,"alrasheedfath","ANA");
};
