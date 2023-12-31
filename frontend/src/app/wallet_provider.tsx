'use client'
import { createContext, useState } from 'react';
import { IBundler, Bundler } from '@biconomy/bundler'
import { BiconomySmartAccountV2, DEFAULT_ENTRYPOINT_ADDRESS } from "@biconomy/account"
import { ParticleAuthModule, ParticleProvider, } from "@biconomy/particle-auth";
import { ChainId } from "@biconomy/core-types"
import { IPaymaster, BiconomyPaymaster,  } from '@biconomy/paymaster'
import { ECDSAOwnershipValidationModule, DEFAULT_ECDSA_OWNERSHIP_MODULE } from "@biconomy/modules";
import { ethers } from "ethers";

interface IWalletContext {
  address: string,
  loading: boolean,
  smartAccount: BiconomySmartAccountV2 | null,
  provider: ethers.providers.Provider | null,
  particle: ParticleAuthModule.ParticleNetwork | null,
  bundler: IBundler | null,
  paymaster: IPaymaster | null,
  connect: () => Promise<void> | null,
}

const WalletContext = createContext<IWalletContext>({
  address: "",
  loading: false,
  smartAccount: null,
  provider: null,
  particle: null,
  bundler: null,
  paymaster: null,
  connect: () => null,
});

function WalletProvider({
  children,
}: {
  children: React.ReactNode
}) {
  const [address, setAddress] = useState<string>("")
  const [loading, setLoading] = useState<boolean>(false);
  const [smartAccount, setSmartAccount] = useState<BiconomySmartAccountV2 | null>(null);
  const [provider, setProvider] = useState<ethers.providers.Provider | null>(null)

  const particle = new ParticleAuthModule.ParticleNetwork({
    projectId: "2df74504-63a8-4b78-ae39-28254335c95c",
    clientKey: "cfvIPJUAYSHOB57kjq1lLAa5CAz8RDuJfZzNew90",
    appId: "944f06f9-7c10-45a1-b6a8-8055e890b712",
    wallet: {
      displayWalletEntry: true,
      defaultWalletEntryPosition: ParticleAuthModule.WalletEntryPosition.BR,
    },
  });
  
  
  const connect = async () => {
    try {
      setLoading(true)
      const userInfo = await particle.auth.login();
      console.log("Logged in user:", userInfo);
      const particleProvider = new ParticleProvider(particle.auth);
      const web3Provider = new ethers.providers.Web3Provider(
        particleProvider,
        "any"
      );
      setProvider(web3Provider)

      const module = await ECDSAOwnershipValidationModule.create({
      signer: web3Provider.getSigner(),
      moduleAddress: DEFAULT_ECDSA_OWNERSHIP_MODULE
      })

      let biconomySmartAccount = await BiconomySmartAccountV2.create({
        chainId: ChainId.POLYGON_MUMBAI,
        bundler: bundler, 
        paymaster: paymaster,
        entryPointAddress: DEFAULT_ENTRYPOINT_ADDRESS,
        defaultValidationModule: module,
        activeValidationModule: module
      })
      setAddress( await biconomySmartAccount.getAccountAddress())
      setSmartAccount(biconomySmartAccount)
      setLoading(false)
    } catch (error) {
      console.error(error);
    }
  };

  
  const bundler: IBundler = new Bundler({
    bundlerUrl: `https://bundler.biconomy.io/api/v2/${ChainId.POLYGON_MUMBAI}/nJPK7B3ru.dd7f7861-190d-41bd-af80-6877f74b8f44`,
    chainId: ChainId.POLYGON_MUMBAI,
    entryPointAddress: DEFAULT_ENTRYPOINT_ADDRESS,
  });
  
  const paymaster: IPaymaster = new BiconomyPaymaster({
    paymasterUrl: "https://paymaster.biconomy.io/api/v1/80001/cdcFTDaqe.193b4733-54ff-4b27-9bbd-ac4523e20605"
  });

  return (
    <WalletContext.Provider value={{
      address, loading, smartAccount, provider, particle, connect, bundler, paymaster
    }}>
    {children}
    </WalletContext.Provider>
  )
}


export { WalletContext, WalletProvider }