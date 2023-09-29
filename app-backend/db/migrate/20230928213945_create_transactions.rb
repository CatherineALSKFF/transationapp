class CreateTransactions < ActiveRecord::Migration[7.0]
  def change
    create_table :transactions do |t|
      t.string :account_id
      t.integer :amount
      t.integer :balance

      t.timestamps
    end
  end
end
