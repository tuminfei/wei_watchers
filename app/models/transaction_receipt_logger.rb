class TransactionReceiptLogger
  include HasEthereumClient

  def self.perform(subscription_id, params)
    subscription = TransactionReceiptSubscription.find(subscription_id)
    new(subscription, params).perform
  end

  def initialize(subscription, params)
    @subscription = subscription
    @params = params
  end

  def perform
    transaction_receipt
  end


  private

  attr_reader :params, :subscription

  def block_hash
    params[:blockHash]
  end

  def block_number
    ethereum.hex_to_int params[:blockNumber]
  end

  def from
    params[:from]
  end

  def to
    params[:to]
  end

  def logs
    params[:logs]
  end

  def root
    params[:root]
  end

  def contract_address
    params[:contractAddress]
  end

  def transaction_hash
    params[:transactionHash]
  end

  def transaction_index
    ethereum.hex_to_int params[:transactionIndex]
  end

  def gas_used
    ethereum.hex_to_int params[:gasUsed]
  end

  def cumulative_gas_used
    ethereum.hex_to_int params[:cumulativeGasUsed]
  end

  def transaction_receipt
    @transaction_receipt ||= (find_transaction_receipt || create_transaction_receipt)
  end

  def find_transaction
    Transaction.find_by({
                            transaction_hash: transaction_hash
                        })
  end

  def find_transaction_receipt
    TransactionReceipt.find_by({
                                   transaction_hash: transaction_hash
                               })
  end

  def create_transaction_receipt
    TransactionReceipt.create({
                                  block_hash: block_hash,
                                  block_number: block_number,
                                  from: from,
                                  to: to,
                                  logs: logs,
                                  root: root,
                                  transaction_hash: transaction_hash,
                                  transaction_index: transaction_index,
                                  contract_address: contract_address,
                                  gas_used: gas_used,
                                  cumulative_gas_used: cumulative_gas_used
                              })
  end

end
