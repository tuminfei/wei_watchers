class TransactionReceiptSubscription < ActiveRecord::Base

  include HasEthereumClient


  belongs_to :transaction, inverse_of: :transaction_receipt_subscriptions
  belongs_to :transaction_subscription, inverse_of: :transaction_receipt_subscriptions
  has_one :subscriber, through: :transaction_subscription

  validates :transaction, presence: true, uniqueness: { scope: [:transaction_subscription] }
  validates :transaction_subscription, presence: true

  before_validation :set_up, on: :create

  scope :current, -> { where "end_at >= ?", Time.now }

  def self.reset_current_filters
    current.pluck(:id).each do |id|
      SubscriptionReset.perform(id)
    end
  end

  private

  def set_up
    self.xid = SecureRandom.uuid
  end

  def formatted_block_height
    "0x#{last_block_height == 0 ? 1.to_s(16) : last_block_height.to_s(16)}"
  end

end
