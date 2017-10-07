class TransactionReceipt < ActiveRecord::Base

  belongs_to :transaction, :class_name => 'Transaction', foreign_key: 'transaction_hash', primary_key: 'transaction_hash'

  validates :block_hash, format: /\A0x[0-9a-f]{64}\z/
  validates :block_number, numericality: { greater_than_or_equal_to: 0 }
  validates :transaction_hash, format: /\A0x[0-9a-f]{64}\z/
  validates :transaction_index, numericality: { greater_than_or_equal_to: 0 }

end
