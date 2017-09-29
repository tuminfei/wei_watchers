class TransactionSubscription < ActiveRecord::Base

  include HasEthereumClient

  belongs_to :subscriber, inverse_of: :transaction_subscriptions

  validates :subscriber, presence: true

  before_validation :set_up, on: :create
  #after_create :check_missed_transactions

  scope :current, -> { where "end_at >= ?", Time.now }

  def self.reset_current_filters
    current.pluck(:id).each do |id|
      SubscriptionReset.perform(id)
    end
  end

  def filter_params
    filter_config.params.merge({
      fromBlock: formatted_block_height,
    }).compact
  end

  private

  def set_up
    self.xid = SecureRandom.uuid
    return unless filter_config.present?
  end

  def check_missed_transactions
    SubscriptionCheck.delay.perform(id)
  end

  def formatted_block_height
    "0x#{ethereum.format_int_to_hex last_block_height}"
  end

end
