class CreateAccounts < ActiveRecord::Migration[6.1]
  def change
    create_table :accounts, id: :uuid do |t|
      t.string :account_id, null: false, unique: true
      t.integer :balance
      t.timestamps
    end
  end
end
