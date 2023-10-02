class Transaction < ApplicationRecord
  belongs_to :account

  validates :account_id, :amount, :created_at, presence: true
end
