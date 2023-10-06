class Api::V1::TransactionsController < ApplicationController
  def index
    render json: Transaction.all
  end

  def show
    render json: Transaction.find(params[:id])
  end

  def create
    transaction = Transaction.new(transaction_params)

  # Check if the account exists
account = Account.find_by(id: transaction.account_id)

# If the account does not exist, create a new account
if account.nil?
  account = Account.new(id: transaction.account_id, balance: transaction.amount)
  account.save!

else
 account.update(balance: account.balance.to_i + transaction.amount.to_f.round.to_i)
end


    if transaction.save
      render json: transaction, status: :created
    else
      render json: transaction.errors, status: :unprocessable_entity
    end
  end

 

  private

  def transaction_params
    params.require(:transaction).permit(:account_id, :amount)
  end
end
