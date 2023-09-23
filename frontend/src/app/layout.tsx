import './globals.css'
import type { Metadata } from 'next'
import { Inter } from 'next/font/google'
import { WalletProvider } from './wallet_provider'

const inter = Inter({ subsets: ['latin'] })

export const metadata: Metadata = {
  title: 'Godot Onchain',
  description: 'ETHGlobal New York 2023',
}

export default function RootLayout({
  children,
}: {
  children: React.ReactNode
}) {

  return (
    <html lang="en">
      <body className={inter.className}>
        <WalletProvider>
          {children}
        </WalletProvider>
        </body>
    </html>
  )
}
