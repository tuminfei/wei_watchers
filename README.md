![WeiWatchers](https://s3.amazonaws.com/smartcontract/off-app/Wei-Watchers-sm.jpg)


## New Watcher

Add New Watcher

```ruby
rake watcher:create
```

Then get Watcher Key..

```ruby
WatcherKey: RANDOM_KEY_1 …
 
  
  
Watcher Key:		2dCKNk-IncccVxtI4G8PcnoLoviH_pvIx_aWOhJHSzpXTDbTZnVFy4OJDsUS9NOrJXrbyUgIukkv9-m9wwNRzw==
Watcher Secret:		K2uTgGdHmhYspwJl-FFLh1b_YLKolk7rX8GYmWK0Ba3LXVwSb4SxwYW6WYQBGQzUvf8pys6RSpTsIL97DvZ-7g==
Notification Key:	2-I_bSAnSK0Eae1Z2i231H0w_JaOQ2nMJUyAhz4Au-jWshyIWzziO9j5I5hy0-JwsJRpDiCWVMPo6nak3uFwmw==
Notification Secret:	nbV-9bbbLryMUnknMtLnZBZjiReKAUqB0ljA7pjoHDtOAmILosb11xXarq8LnLwYU7wJCvLQp2wxObGNICG4hg==
```
## Startup

```ruby
foreman start
```

## Watcher API

```shell
#API Status
curl -u WatcherKey:WatcherSecret http://localhost:3000/api/status

#Balance
curl -u WatcherKey:WatcherSecret  -X POST -d subscription='{"address": "0x00E89e4Ace8c83E6e345d6faA771E1E8c505F350", "endAt": "1813520678"}' http://localhost:3000/api/balance_subscriptions

#EventLog
curl -u WatcherKey:WatcherSecret -X POST -d "address=0x00E89e4Ace8c83E6e345d6faA771E1E8c505F350&endAt=1813520678" http://localhost:3000/api/event_subscriptions

#Transaction
curl -u WatcherKey:WatcherSecret -X POST -d "address=0x286b51468b03fb336aee6e46B6EC4750E8b6f297&endAt=1813520678" http://localhost:3000/api/transaction_subscriptions
 
  
   
######################EXAMPLE######################

#curl -u 2dCKNk-IncccVxtI4G8PcnoLoviH_pvIx_aWOhJHSzpXTDbTZnVFy4OJDsUS9NOrJXrbyUgIukkv9-m9wwNRzw==:K2uTgGdHmhYspwJl-FFLh1b_YLKolk7rX8GYmWK0Ba3LXVwSb4SxwYW6WYQBGQzUvf8pys6RSpTsIL97DvZ-7g==  -X POST -d subscription='{"address": "0x04cCc070C6007B2B422Ab4B52BDA60d5d8693AbF", "endAt": "1813520678"}' http://localhost:3000/api/balance_subscriptions
#curl -u 2dCKNk-IncccVxtI4G8PcnoLoviH_pvIx_aWOhJHSzpXTDbTZnVFy4OJDsUS9NOrJXrbyUgIukkv9-m9wwNRzw==:K2uTgGdHmhYspwJl-FFLh1b_YLKolk7rX8GYmWK0Ba3LXVwSb4SxwYW6WYQBGQzUvf8pys6RSpTsIL97DvZ-7g== -X POST -d "address=0x29b5f6efad2ad701952dfde9f29c960b5d6199c5&endAt=1813520678&topics=0xddf252ad1be2c89b69c2b068fc378daa952ba7f163c4a11628f55a4df523b3ef" http://localhost:3000/api/event_subscriptions
#curl -u 2dCKNk-IncccVxtI4G8PcnoLoviH_pvIx_aWOhJHSzpXTDbTZnVFy4OJDsUS9NOrJXrbyUgIukkv9-m9wwNRzw==:K2uTgGdHmhYspwJl-FFLh1b_YLKolk7rX8GYmWK0Ba3LXVwSb4SxwYW6WYQBGQzUvf8pys6RSpTsIL97DvZ-7g== -X POST -d "address=0x286b51468b03fb336aee6e46B6EC4750E8b6f297&endAt=1813520678" http://localhost:3000/api/transaction_subscriptions
```
 
## API Params

#### Balance

```
address:string,an Ethereum contract address
endAt:integer,a Unix timestamp specifying when the subscription expires
```

#### Event

```
address:string,an Ethereum contract address
endAt:integer,a Unix timestamp specifying when the subscription expires
fromBlock:integer,block number of the earliest block to query from(defaults to the genesis block)
toBlock:integer,block number of the latest block to query up to(defaults to the latest block)
topics:array,array of topic IDs, to filter down to specific types of events at an address you would like updates on
```

#### Transaction

```
address:string,an Ethereum contract address
endAt:integer,a Unix timestamp specifying when the subscription expires
fromBlock:integer,block number of the earliest block to query from(defaults to the genesis block)
toBlock:integer,block number of the latest block to query up to(defaults to the latest block)
```

## Query API
 
```shell
curl -u WatcherKey:WatcherSecret -X GET -d "address=0x5c13a82ff280cdd8e6fa12c887652e5de1cd65a8" http://47.52.54.185:5000/api/query/eth_account_transactions
 
curl -u WatcherKey:WatcherSecret -X GET -d "address=0x5c13a82ff280cdd8e6fa12c887652e5de1cd65a8" http://47.52.54.185:5000/api/query/eth_account_transactions_gas_value
 
curl -u WatcherKey:WatcherSecret -X GET -d "address=0x5c13a82ff280cdd8e6fa12c887652e5de1cd65a8" http://47.52.54.185:5000/api/query/eth_account_transactions_gas
 
curl -u WatcherKey:WatcherSecret -X GET -d "address=0x5c13a82ff280cdd8e6fa12c887652e5de1cd65a8" http://47.52.54.185:5000/api/query/eth_account_fee
```
 
### A service for push notifications of Ethereum logs and account balances.

### API documentation is [available here](https://weiwatchers-docs.smartcontract.com). If you have any questions, please [reach out](mailto:support@smartcontract.com).

