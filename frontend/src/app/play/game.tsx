'use client'
import Script from 'next/script'
import { createContext, useContext, useEffect } from 'react'

interface IGameContext {
	submitScore: (game_log: String) => Promise<void> | null,
	getHighscores: () => Promise<void> | null,
	getPlayerScore: () => Promise<void> | null,
}

const GameContext = createContext<IGameContext>({
	submitScore: async (game_log) => {
		let inputBoxAddress = "0x3c10a622f33d762f452109b9ea4485e3d271e471";
		let cartesiDappAddress = "0x3c10a622f33d762f452109b9ea4485e3d271e471";
		let cartesiNodeUrl = "127.0.0.1:8545";
		console.log("Godot called this!")
		console.log(game_log)
		// const contract = new ethers.Contract( inputBoxAddress , inputBoxAbi, provider)
		//   try {
		// 	const minTx = await contract.populateTransaction.addInput(game_log);
		// 	console.log(minTx.data);
		// 	const tx1 = {
		// 	  to: inputBoxAddress,
		// 	  data: minTx.data,
		// 	};

		// 	let userOp = await smartAccount.buildUserOp([tx1]);
		// 	console.log({ userOp })
		// 	const biconomyPaymaster =
		// 	  smartAccount.paymaster as IHybridPaymaster<SponsorUserOperationDto>;
		// 	let paymasterServiceData: SponsorUserOperationDto = {
		// 	  mode: PaymasterMode.SPONSORED,
		// 	  smartAccountInfo: {
		// 		name: 'BICONOMY',
		// 		version: '2.0.0'
		// 	  },
		// 	};
		// 	const paymasterAndDataResponse =
		// 	  await biconomyPaymaster.getPaymasterAndData(
		// 		userOp,
		// 		paymasterServiceData
		// 	  );
			  
		// 	userOp.paymasterAndData = paymasterAndDataResponse.paymasterAndData;
		// 	const userOpResponse = await smartAccount.sendUserOp(userOp);
		// 	console.log("userOpHash", userOpResponse);
		// 	const { receipt } = await userOpResponse.wait(1);
		// 	console.log("txHash", receipt.transactionHash);
		//   } catch (err: any) {
		// 	console.error(err);
		// 	console.log(err)
		//   }

		// call Cartesi InputBox with game log
		// poll for outputs
		// If valid score
		// 	run voucher
	},
	getHighscores: async () => {
		let leaderboardAddress = "0x7773a4B9C0B86AF9314a8C923930Ab238945f7a6";
		// const contract = new ethers.Contract( leaderboardAddress , leaderboardAbi, provider)
	},
	getPlayerScore: async () => {
		let leaderboardAddress = "0x7773a4B9C0B86AF9314a8C923930Ab238945f7a6";
		// const contract = new ethers.Contract( leaderboardAddress , leaderboardAbi, provider)
	}
})

export default function Game() {
	let { submitScore, getHighscores, getPlayerScore } = useContext(GameContext);
	useEffect(() => {
		//@ts-ignore
		window.submitScore = submitScore;
		//@ts-ignore
		window.getHighscores = getHighscores;
		//@ts-ignore
		window.getPlayerScore = getPlayerScore;
	  }, []);

    return(
		<div className="m-0 p-0 border-none text-center">
			<canvas id="canvas">
				HTML5 canvas appears to be unsupported in the current browser.
				Please try updating or use a different browser.
			</canvas>
			<div id="status">
				<div id="status-progress">
					<div id ="status-progress-inner"></div>
				</div>
				<div id="status-indeterminate">
					<div></div>
					<div></div>
					<div></div>
					<div></div>
					<div></div>
					<div></div>
					<div></div>
					<div></div>
				</div>
				<div id="status-notice"></div>
			</div>
	 
			<Script src="./client/runner-onchain.js" strategy='afterInteractive'/>
			<Script src="./client/game.js" strategy='afterInteractive'/>
		</div>
    )
}