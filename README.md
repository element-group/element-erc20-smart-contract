# Element Group ERC20 Ethereum Smart Contract

An `ERC20` standard token. Built on the [OpenZeppelin](https://openzeppelin.org/) framework.

## Development

### Setup

You'll need the [yarn tool installed](https://yarnpkg.com/lang/en/docs/install/).

Install dev dependencies:

```
cd element-erc20-smart-contract
yarn
```

### Test

Running `yarn test` will also take care of starting/stopping `testrpc`.

```
yarn test
```

### Flatten

To flatten the contract into a single file for Etherscan you can run the flatten command.

```
yarn flatten
```

This will output:

```
build/ElementToken_flat.sol
build/ElementToken_oneline.sol
```


### Deploying

You can deploy this via my