class TransactionSerializer < ActiveModel::Serializer
  attributes :id, :amount
  belongs_to :account

end
