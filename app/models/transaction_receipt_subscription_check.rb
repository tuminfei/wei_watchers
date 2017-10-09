class TransactionReceiptSubscriptionCheck

  include HasEthereumClient

  def self.schedule_checks(current_block = nil)
    current_block ||= EthereumClient.new.current_block_height

    TransactionReceiptSubscription.current.is_done.pluck(:id).uniq.each do |subscription_id|
      delay.perform subscription_id, current_block
    end
  end

  def self.perform(id, current_block = nil)
    subscription = TransactionReceiptSubscription.find(id)
    new(subscription, current_block).perform
  end

  def initialize(subscription, current_block = nil)
    @subscription = subscription
    @current_block = current_block
  end

  def perform
    new_transaction_receipt_params = new_transaction_receipt
    #暂时屏蔽logs字段
    new_transaction_receipt_params['logs'] = ''
    #Rails.logger.info new_transaction_receipt_params['logs']
    #Rails.logger.info new_transaction_receipt_params
    TransactionReceiptLogger.delay.perform(subscription.id, new_transaction_receipt_params)
    update_subscription_block_height
  end


  private

  attr_reader :current_block, :subscription

  def new_transaction_receipt
    @new_transaction_receipt ||= ethereum.get_transaction_receipt(subscription.transaction_hash)
  end

  def update_subscription_block_height
    if current_block.present?
      subscription.update_attributes! last_block_height: current_block
    end
  end

end
