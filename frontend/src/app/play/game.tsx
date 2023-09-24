'use client'
import Script from 'next/script'
import { createContext, useContext, useEffect } from 'react'

interface IGameContext {
	submitScore: () => Promise<void> | null
}

const GameContext = createContext<IGameContext>({
	submitScore: async () => {
		console.log("Godot called this!")
		// Retrieve game log
		// call Cartesi InputBox with game log
		// poll for outputs
		// If valid score
		// 	run voucher
	}
})

export default function Game() {
	let { submitScore } = useContext(GameContext);
	useEffect(() => {
		//@ts-ignore
		window.submitScore = submitScore;
	  }, []);

    return(
		<div className="m-0 p-0 border-none text-center">
			<button onClick={submitScore}>Press me</button>
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