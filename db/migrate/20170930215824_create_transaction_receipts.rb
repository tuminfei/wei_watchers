class CreateTransactionReceipts < ActiveRecord::Migration
  def change
    create_table :transaction_receipts do |t|
      t.string :transaction_hash
      t.string :transaction_index
      t.string :block_hash
      t.integer :block_number
      t.bigint :cumulative_gas_used
      t.bigint :gas_used
      t.text :logs
      t.string :root, :default => 0
      t.integer :status
      t.timestamps
    end
  end
end
