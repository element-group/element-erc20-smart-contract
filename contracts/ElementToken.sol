pragma solidity ^0.4.13;


import "zeppelin-solidity/contracts/token/StandardToken.sol";
import "zeppelin-solidity/contracts/lifecycle/Pausable.sol";


/**
 * @title Element Token
 * @dev ERC20 Element Token)
 *
 * All initial tokens are assigned to the creator of
 * this contract.
 *
 */
contract ElementToken is StandardToken, Pausable {

  string public name = '';               // Set the token name for display
  string public symbol = '';             // Set the token symbol for display
  uint8 public decimals = 0;             // Set the token symbol for display

  /**
   * @dev Don't allow tokens to be sent to the contract
   */
  modifier rejectTokensToContract(address _to) {
    require(_to != address(this));
    _;
  }

  /**
   * @dev ElementToken Constructor
   * Runs only on initial contract creation.
   */
  function ElementToken(string _name, string _symbol, uint256 _tokens, uint8 _decimals) {
    name = _name;
    symbol = _symbol;
    decimals = _decimals;
    totalSupply = _tokens * 10**uint256(decimals);          // Set the total supply
    balances[msg.sender] = totalSupply;                      // Creator address is assigned all
    Transfer(0x0, msg.sender, totalSupply);                  // create Transfer event for minting
  }

  /**
   * @dev Transfer token for a specified address when not paused
   * @param _to The address to transfer to.
   * @param _value The amount to be transferred.
   */
  function transfer(address _to, uint256 _value) rejectTokensToContract(_to) public whenNotPaused returns (bool) {
    return super.transfer(_to, _value);
  }

  /**
   * @dev Transfer tokens from one address to another when not paused
   * @param _from address The address which you want to send tokens from
   * @param _to address The address which you want to transfer to
   * @param _value uint256 the amount of tokens to be transferred
   */
  function transferFrom(address _from, address _to, uint256 _value) rejectTokensToContract(_to) public whenNotPaused returns (bool) {
    return super.transferFrom(_from, _to, _value);
  }

  /**
   * @dev Aprove the passed address to spend the specified amount of tokens on behalf of msg.sender when not paused.
   * @param _spender The address which will spend the funds.
   * @param _value The amount of tokens to be spent.
   */
  function approve(address _spender, uint256 _value) public whenNotPaused returns (bool) {
    return super.approve(_spender, _value);
  }

  /**
   * Adding whenNotPaused
   */
  function increaseApproval (address _spender, uint _addedValue) public whenNotPaused returns (bool success) {
    return super.increaseApproval(_spender, _addedValue);
  }

  /**
   * Adding whenNotPaused
   */
  function decreaseApproval (address _spender, uint _subtractedValue) public whenNotPaused returns (bool success) {
    return super.decreaseApproval(_spender, _subtractedValue);
  }

}
