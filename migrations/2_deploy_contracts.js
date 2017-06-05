var ConvertLib = artifacts.require("./ConvertLib.sol");
var AddressTags = artifacts.require("./AddressTags.sol");

module.exports = function(deployer) {
  deployer.deploy(ConvertLib);
  deployer.link(ConvertLib, AddressTags);
  deployer.deploy(AddressTags);
};
