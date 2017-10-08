class TransactionSubscriptionCheck

  include HasEthereumClient

  def self.schedule_checks(current_block = nil)
    current_block ||= EthereumClient.new.current_block_height

    TransactionSubscription.current.each do |subscription|
      current_sync_block = subscription.sync_block_count
      delay.perform subscription.id, current_block, current_sync_block
    end
  end

  def self.perform(id, current_block = nil, current_sync_block = nil)
    subscription = TransactionSubscription.find(id)
    new(subscription, current_block, current_sync_block).perform
  end

  def initialize(subscription, current_block = nil, current_sync_block = nil)
    @subscription = subscription
    @current_block = current_block
    @current_sync_block = current_sync_block
  end

  def perform
    new_transactions.each do |log|
      TransactionLogger.delay.perform(subscription.id, log)
    end

    update_subscription_block_height
  end


  private

  attr_reader :current_block, :subscription, :current_sync_block

  def new_transactions
    @new_transactions ||= ethereum.get_transactions(subscription.filter_params).result.transactions
  end

  def update_subscription_block_height
    if current_block.present?
      subscription.update_attributes! last_block_height: current_block, sync_block: current_sync_block
    end
  end

end
