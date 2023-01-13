const Contract1 = artifacts.require("Contract1");
const Contract2 = artifacts.require("Contract2");
const Contract3 = artifacts.require("Contract3");

module.exports = async function(deployer, network, accounts) {
  await deployer.deploy(Contract1)
  const contract1 = await Contract1.deployed()

  await deployer.deploy(Contract2, contract1.address)
  const contract2 = await Contract2.deployed()

  await deployer.deploy(Contract3, contract1.address)
  const contract3 = await Contract3.deployed()
  
};
