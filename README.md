# Retro Rollers Onchain
## ETHGlobal New York 2023

## High Level Design

 - 2D Platformer (similar to Geometry Dash) running in browser.
 - Map designer allows players to publish maps as ERC-721 NFTs.
 - Players aim to complete level as fast as possible.
 - Log of gameplay is published to game server running on Cartesi Machine.
 - Server verifies valid gameplay & publishes score to Token Leaderboard (stored in metadata)
 - Publishing score requires putting up a wager
 - Wagers are stored in Map NFT Token-bound account
 - Top leaderboard position is able to claim vault after <limitations>
 - Minting a map requires a minimum $RLLR wager + completing the map


### Tokenomics & Tools
 - Maps: ERC-721 w/ Token-bound wallet
    - Map data stored as minified JSON Array
 - $RLLR: Minting, Gas, and Wagering token
 - Airstack: Viewing Map vaults
 - Cartesi: Running Game Server
 - Biconomy: Custodial wallets + gasless minting
 - The Graph: Map + Leaderboard browser
