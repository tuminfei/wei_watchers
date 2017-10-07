class TransactionSubscription < ActiveRecord::Base

  include HasEthereumClient

  belongs_to :subscriber, inverse_of: :transaction_subscriptions
  belongs_to :account
  has_one :transaction_receipt_subscription

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
    [formatted_block_height, true].compact
  end

  private

  def set_up
    self.xid = SecureRandom.uuid
  end

  def check_missed_transactions
    TransactionSubscriptionCheck.delay.perform(id)
  end

  def formatted_block_height
    "0x#{last_block_height == 0 ? 1.to_s(16) : last_block_height.to_s(16)}"
  end

end
