#!/bin/bash

set -ex

forge build
forge test

ETH_RPC_URL="https://eth-sepolia.g.alchemy.com/v2/bTCjJ7fioHboeIcfvgVQCjJFQ3JuBNz-"

forge create --rpc-url $ETH_RPC_URL --private-key $PRIVATE_KEY src/Leaderboard.sol:Leaderboard