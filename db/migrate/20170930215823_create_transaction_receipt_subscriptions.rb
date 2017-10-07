class CreateTransactionReceiptSubscriptions < ActiveRecord::Migration
  def change
    create_table :transaction_receipt_subscriptions do |t|
      t.integer :transaction_id
      t.integer :transaction_subscriber_id
      t.string :transaction_hash
      t.string :transaction_index
      t.string :block_hash
      t.integer :block_number
      t.bigint :cumulative_gas_used
      t.bigint :gas_used
      t.text :logs
      t.string :root, :default => 0
      t.integer :status
      t.datetime :end_at
      t.timestamps
    end
  end
end
