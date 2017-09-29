class Transaction < ActiveRecord::Base

  belongs_to :account_from, :class_name => 'Account', foreign_key: 'from', primary_key: 'address'
  belongs_to :account_to, :class_name => 'Account', foreign_key: 'to', primary_key: 'address'

  validates :block_hash, format: /\A0x[0-9a-f]{64}\z/
  validates :block_number, numericality: { greater_than_or_equal_to: 0 }
  validates :transaction_hash, format: /\A0x[0-9a-f]{64}\z/
  validates :transaction_index, numericality: { greater_than_or_equal_to: 0 }

end
