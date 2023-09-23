import Script from 'next/script'

export default function Game() {
    return(
        <>
        <canvas id="canvas" className="block">
			HTML5 canvas appears to be unsupported in the current browser.
			Please try updating or use a different browser.
		</canvas>
		<div id="status" className='flex align-items-center justify-center'>
			<div id="status-progress" className="hidden w-5/6">
				<div id ="status-progress-inner" className="box-border rounded-e"></div>
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
 
        <Script src="./client/runner-onchain.js" strategy='afterInteractive'/>
        <Script src="./client/game.js" strategy='afterInteractive'/>
        </>
    )
}