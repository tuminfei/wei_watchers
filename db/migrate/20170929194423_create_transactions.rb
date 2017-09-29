class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.string :block_hash
      t.integer :block_number
      t.string :from
      t.string :to
      t.bigint :gas
      t.bigint :gas_price
      t.string :transaction_hash
      t.string :input, :limit => 500
      t.integer :nonce
      t.integer :transaction_index
      t.bigint :value
      t.string :v
      t.string :r
      t.string :s
      t.timestamps
    end
  end
end