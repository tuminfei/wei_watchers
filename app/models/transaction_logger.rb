class TransactionLogger

  def self.perform(subscription_id, params)
    subscription = TransactionSubscription.find(subscription_id)
    new(subscription, params.with_indifferent_access).perform
  end

  def initialize(subscription, params)
    @subscription = subscription
    @params = params
  end

  def perform

  end


  private

  attr_reader :params, :subscription

  def account_from
    Account.find_or_create_by(address: params[:from])
  end

  def account_to
    Account.find_or_create_by(address: params[:to])
  end

  def block_hash
    params[:blockHash]
  end

  def block_number
    ethereum.hex_to_int params[:blockNumber]
  end

  def transaction_hash
    params[:hash]
  end

  def transaction_index
    ethereum.hex_to_int params[:transactionIndex]
  end

  def transaction_hash
    params[:transactionHash]
  end

  def transaction_index
    ethereum.hex_to_int params[:transactionIndex]
  end

  def transaction
    @transaction ||= (find_transaction || create_transaction)
  end

  def find_transaction
    Transaction.find_by({
                            transaction_hash: transaction_hash
                        })
  end

  def create_transaction
    Transaction.create({
                           block_hash: block_hash,
                           block_number: block_number,
                           from: from,
                           to: to,
                           gas: gas,
                           gas_price: gas_price,
                           transaction_hash: transaction_hash,
                           input: input,
                           nonce: nonce,
                           transaction_index: transaction_index,
                           value: value,
                           v: v,
                           r: r,
                           s: s

                       })
  end

end
