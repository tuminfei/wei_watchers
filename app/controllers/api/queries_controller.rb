module Api
  class QueriesController < ApiController
    def eth_account_balance
      account = Account.where(:address => params[:address])
      if account.present?
        render json: {
            address: params[:address],
            balance: account.balance,
            time: account.updated_at.to_i.to_s,
        }
      else
        render json: {
            errors: ['Temporarily unavailable.'],
            time: Time.now.to_i
        }, status: :service_unavailable
      end
    end

    def eth_account_transactions
      account = params[:address]
      transactions = Transaction.where(:from => account)

      if account.present? and !transactions.empty?
        render json: {
            transactions: transactions.map,
            time: Time.now.to_i.to_s,
        }
      else
        render json: {
            errors: ['Temporarily unavailable.'],
            time: Time.now.to_i
        }, status: :service_unavailable
      end
    end

    def eth_account_transactions_gas_value
      account = params[:address]
      transactions = Transaction.where(:from => account).includes(:transaction_receipt)

      if account.present? and !transactions.empty?
        render json: {
            transactions: transactions.pluck(:id, :transaction_hash, :from, :to, :gas_price, 'transaction_receipts.gas_used', :value),
            time: Time.now.to_i.to_s,
        }
      else
        render json: {
            errors: ['Temporarily unavailable.'],
            time: Time.now.to_i
        }, status: :service_unavailable
      end
    end

    def eth_account_transactions_gas
      account = params[:address]
      transactions = Transaction.where(:from => account).includes(:transaction_receipt)

      if account.present? and !transactions.empty?
        render json: {
            transactions: transactions.pluck(:id, :transaction_hash, :from, :to, :gas_price, 'transaction_receipts.gas_used'),
            time: Time.now.to_i.to_s,
        }
      else
        render json: {
            errors: ['Temporarily unavailable.'],
            time: Time.now.to_i
        }, status: :service_unavailable
      end
    end

    def eth_account_fee
      account = params[:address]
      transactions = Transaction.where(:from => account).includes(:transaction_receipt).sum('transactions.gas_price * transaction_receipts.gas_used')

      if account.present? and transactions.present?
        render json: {
            fee: transactions.to_s,
            time: Time.now.to_i.to_s,
        }
      else
        render json: {
            errors: ['Temporarily unavailable.'],
            time: Time.now.to_i
        }, status: :service_unavailable
      end
    end
  end
end
