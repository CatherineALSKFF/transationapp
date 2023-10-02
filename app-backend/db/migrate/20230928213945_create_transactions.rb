
class CreateTransactions < ActiveRecord::Migration[6.1]
  def change
    create_table :transactions, id: :uuid do |t|
      t.references :account, type: :uuid, null: false, foreign_key: true
      t.integer :amount
      t.datetime :created_at, null: false, default: -> { 'CURRENT_TIMESTAMP' }
      t.timestamps
    end
  end
end
