#!/bin/bash

set -ex

forge build
forge test

ETH_RPC_URL="https://endpoints.omniatech.io/v1/matic/mumbai/public"

forge create --rpc-url $ETH_RPC_URL --private-key $PRIVATE_KEY src/Leaderboard.sol:Leaderboard