'use client'
import { useContext } from "react"
import { WalletContext } from "./wallet_provider"

export default function Home() {
  let { loading, address, connect } = useContext(WalletContext)

  return (
    <main className="flex h-screen place-content-center align-middle">
      <div className="place-content-center align-middle m-auto">
        <h1 className="">Based Account Abstraction</h1>
        <h2>Connect and Mint your AA powered NFT now</h2>
        {!loading && !address && <button onClick={connect} className="">Connect to Based Web3</button>}
        {loading && <p>Loading Smart Account...</p>}
        {address && <h2>Smart Account: {address}</h2>}
        {address && <a href="/play">Play</a>}
      </div>
    </main>
  )
}
