class FilterReseter

  include HasEthereumClient

  def self.perform(subscription_id)
    subscription = EventSubscription.find subscription_id
    new(subscription).perform
  end

  def initialize(subscription)
    @subscription = subscription
    @filter_config = subscription.filter_config
  end

  def perform
    update_filter
    record_past_events
  end


  private

  attr_reader :filter_config, :subscription

  def update_filter
    filter_config.update_attributes!(xid: new_filter_id)
  end

  def record_past_events
    past_events.each do |event|
      EventLogger.perform(filter_config.id, event)
    end
  end

  def past_events
    @past_events ||= ethereum.get_filter_logs(new_filter_id)
  end

  def new_filter_id
    @new_filter_id ||= filter_config.new_on_chain_filter(fromBlock: 0)
  end

end
