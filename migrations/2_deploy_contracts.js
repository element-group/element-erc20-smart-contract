var ElementToken = artifacts.require('./ElementToken.sol')

module.exports = function (deployer) {
  deployer.deploy(ElementToken, "Element Token", "ELM", 1e9, 8)
}
