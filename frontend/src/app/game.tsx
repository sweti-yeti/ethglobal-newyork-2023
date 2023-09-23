import Script from 'next/script'

export default function Game() {
    return(
        <>
        <canvas id="canvas">
			HTML5 canvas appears to be unsupported in the current browser.
			Please try updating or use a different browser.
		</canvas>
		<div id="status">
			<div id="status-progress" className="hidden">
				<div id ="status-progress-inner"></div>
			</div>
			<div id="status-indeterminate" className="hidden">
				<div></div>
				<div></div>
				<div></div>
				<div></div>
				<div></div>
				<div></div>
				<div></div>
				<div></div>
			</div>
			<div id="status-notice" className="m-32 p-32"></div>
		</div>
 
        <Script src="./client/runner-onchain.js"/>
        <Script src="./client/game.js"/>
        </>
    )
}