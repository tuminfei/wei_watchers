Rails.application.routes.draw do
  root 'application#home'

  namespace :api do
    resource :query do
      member do
        get :eth_account_transactions
        get :eth_account_transactions_gas_value
        get :eth_account_transactions_gas
        get :eth_account_fee
      end
    end
  end

  scope path: :api do
    get 'status' => 'api#status'

    get 'call' => 'call#show'
    resource :ethereum, only: [] do
      get 'gas_price' => 'ethereum#gas_price'
      get 'get_transaction_count' => 'ethereum#get_transaction_count'
      get 'get_transaction' => 'ethereum#get_transaction'
      post 'send_raw_transaction' => 'ethereum#send_raw_transaction'
    end
    resources :balance_subscriptions, only: [:create]
    resources :event_subscriptions, only: [:create]
    resources :transaction_subscriptions, only: [:create]
    resources :subscriptions, only: [:create], controller: 'balance_subscriptions'
  end
end
