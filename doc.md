curl -u aDuiBj1RJk3Z7utL2dOZIgJfiVHC2QyBAzOxIJ3TF-2SZauSkk5_kn3_Pq2-EmBzjBT9nsYLbjlLQhzqEdt5fQ==:arKwXNYYlMbpkzPibOHvh0xQaadzuvQ7YoftIBeMatDrFKr2vFF-YnyPL-1BGOkPiJV327vBFM8m9fc9c63iHA==  -X POST -d subscription='{"address": "0x00E89e4Ace8c83E6e345d6faA771E1E8c505F350", "endAt": "1813520678"}' http://localhost:3000/api/balance_subscriptions


curl -u aDuiBj1RJk3Z7utL2dOZIgJfiVHC2QyBAzOxIJ3TF-2SZauSkk5_kn3_Pq2-EmBzjBT9nsYLbjlLQhzqEdt5fQ==:arKwXNYYlMbpkzPibOHvh0xQaadzuvQ7YoftIBeMatDrFKr2vFF-YnyPL-1BGOkPiJV327vBFM8m9fc9c63iHA== http://localhost:3000/status


curl -u aDuiBj1RJk3Z7utL2dOZIgJfiVHC2QyBAzOxIJ3TF-2SZauSkk5_kn3_Pq2-EmBzjBT9nsYLbjlLQhzqEdt5fQ==:arKwXNYYlMbpkzPibOHvh0xQaadzuvQ7YoftIBeMatDrFKr2vFF-YnyPL-1BGOkPiJV327vBFM8m9fc9c63iHA== -X POST -d "address=0xda1e6a532b15f5f6d8e6504a67eadb88305ac5f9&endAt=1813520678" http://localhost:3000/api/event_subscriptions


curl -X POST --data '{"jsonrpc":"2.0","method":"eth_getLogs","params":[{"address":"0x9B11EFcAAA1890f6eE52C6bB7CF8153aC5d74139","fromBlock":"0x416956","topics":["0xddf252ad1be2c89b69c2b068fc378daa952ba7f163c4a11628f55a4df523b3ef"]}],"id":74}' http://localhost:8545


curl -X POST --data '{"id":599011,"jsonrpc":"2.0","method":"eth_getLogs","params":[{"address":"0x29b5f6efad2ad701952dfde9f29c960b5d6199c5","fromBlock":"0x0000000000000000000000000000000000000000000000000000000000000000","topics":["0xddf252ad1be2c89b69c2b068fc378daa952ba7f163c4a11628f55a4df523b3ef"]}]}' http://47.52.31.232:8545


ruby bin/delayed_job start

clockwork config/clock.rb


curl -X POST --data '{"jsonrpc":"2.0","method":"eth_getBlockByNumber","params":["0x1b4", true],"id":1}' http://localhost:8545


curl -X POST --data '{"id":122240,"jsonrpc":"2.0","method":"eth_getBlockByNumber","params":["0x1"]}' http://localhost:8545


curl -X POST --data '{"id":122240,"jsonrpc":"2.0","method":"eth_getBlockByNumber","params":["0xf49e770000cdfb382ac893dc353dcbccb68227dc76e301b760a649792964f193"]}' http://47.52.31.232:8545
