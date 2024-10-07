-include .env

.PHONY: all test deploy

build:
	forge build

test:
	forge test

install:
	forge install cyfrin/foundry-devops --no-commit && forge install smartcontractkit/chainlink-brownie-contracts --no-commit && forge install foundry-rs/forge-std --no-commit && forge install transmissions11/solmate --no-commit

deploy-sepolia:
	@forge script script/DeployRaffle.s.sol:DeployRaffle --fork-url $(SEPOLIA_RPC_URL) --account default --broadcast --verify --etherscan-api-key $(ETHERSCAN_API_KEY) -vvvv