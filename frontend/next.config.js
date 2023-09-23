/** @type {import('next').NextConfig} */

const nextConfig = {
    reactStrictMode: true,
    async headers() {
        return [
            {
                source: '/',
                headers: [
                    {
                        key: "Cross-Origin-Opener-Policy",
                        value: "same-origin"
                    },
                    {
                        key: "Cross-Origin-Embedder-Policy",
                        value: "credentialless"
                    },
                ]
                
            },
            {
                source: '/client/:path*',
                headers: [
                    {
                        key: "Cross-Origin-Opener-Policy",
                        value: "same-origin"
                    },
                    {
                        key: "Cross-Origin-Embedder-Policy",
                        value: "credentialless"
                    },
                ]

            }
        ]
    },
    // webpack: (config, { isServer }) => {
    //   if (!isServer) {
    //     config.resolve.fallback = {
    //       "fs": false,
    //       "net": false,
    //       "tls": false
    //     }
    //   }
    //   return config
    // }
  }

module.exports = nextConfig
