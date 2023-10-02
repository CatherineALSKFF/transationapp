class Account < ApplicationRecord
    has_many :transactions, dependent: :destroy
  
    validates :account_id, presence: true, uniqueness: true
  end