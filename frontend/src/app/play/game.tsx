'use client'
import Script from 'next/script'
import { createContext, useContext, useEffect } from 'react'

interface IGameContext {
	submitScore: (game_log: String) => Promise<void> | null,
	getHighscores: () => Promise<void> | null,
	getPlayerScore: () => Promise<void> | null,
}

const GameContext = createContext<IGameContext>({
	submitScore: async (game_log: String) => {
		console.log("Godot called this!")
		console.log(game_log)
		// call Cartesi InputBox with game log
		// poll for outputs
		// If valid score
		// 	run voucher
	},
	getHighscores: async () => {
	},
	getPlayerScore: async () => {
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