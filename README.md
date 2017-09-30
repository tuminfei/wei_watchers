![WeiWatchers](https://s3.amazonaws.com/smartcontract/off-app/Wei-Watchers-sm.jpg)


### A service for push notifications of Ethereum logs and account balances.

### API documentation is [available here](https://weiwatchers-docs.smartcontract.com). If you have any questions, please [reach out](mailto:support@smartcontract.com).

## New Watcher

Add New Watcher

```ruby
rake watcher:create
```

Then get Watcher Key..

```ruby
WatcherKey: RANDOM_KEY_1 …
```

## Watcher API

```shell
curl -u WatcherKey:WatcherSecret  -X POST -d subscription='{"address": "0x00E89e4Ace8c83E6e345d6faA771E1E8c505F350", "endAt": "1813520678"}' http://localhost:3000/api/balance_subscriptions
```