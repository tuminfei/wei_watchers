class CreateTransactionSubscribers < ActiveRecord::Migration
  def change
    create_table :transaction_subscribers do |t|
      t.integer :account_id
      t.integer :subscriber_id
      t.string :trans_type
      t.integer :last_block_height, :default => 0
      t.string :xid
      t.datetime :end_at
      t.timestamps
    end
  end
end
