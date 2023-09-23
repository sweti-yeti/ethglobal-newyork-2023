import Script from 'next/script'

export default function Game() {
    return(
        <>
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
        </>
    )
}