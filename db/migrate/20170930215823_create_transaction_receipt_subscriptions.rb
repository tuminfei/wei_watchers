class CreateTransactionReceiptSubscriptions < ActiveRecord::Migration
  def change
    create_table :transaction_receipt_subscriptions do |t|
      t.integer :transaction_id
      t.integer :transaction_subscription_id
      t.string :transaction_hash
      t.string :xid
      t.datetime :end_at
      t.integer :last_block_height, :default => 0
      t.timestamps
    end
  end
end
