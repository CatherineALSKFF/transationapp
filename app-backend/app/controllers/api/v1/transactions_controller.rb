class Api::V1::TransactionsController < ApplicationController
  def index
    render json: Transaction.all
  end

  def show
    render json: Transaction.find(params[:id])
  end

  def create
    transaction = Transaction.new(transaction_params)

    # Update the account balance before saving the transaction
    account = Account.find(transaction.account_id)
    account.update(balance: account.balance.to_i + transaction.amount.to_f.round.to_i)

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
