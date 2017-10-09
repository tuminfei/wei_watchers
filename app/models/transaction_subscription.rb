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
    [sync_block_height, true].compact
  end

  def sync_block_count
    sync_block_int = 0
    if from_block.present?
      if to_block.nil?
        to_block_heigh = last_block_height
      else
        to_block_heigh = to_block
      end
      sync_block_int = sync_block.nil? ? from_block : (sync_block + 1)
      if to_block_heigh != 0
        sync_block_int = sync_block_int > to_block_heigh ? to_block_heigh : sync_block_int
      else
        sync_block_int = from_block + 1
      end
    else
      sync_block_int = last_block_height == 0 ? 1 : last_block_height
    end
    sync_block_int
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

  #同步块
  def sync_block_height
    "0x#{sync_block_count.to_s(16)}"
  end

end
