const Food = artifacts.require("./FoodSafe.sol");

module.exports = function(deployer) {
  deployer.deploy(Food);
};
