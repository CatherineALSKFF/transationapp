class TransactionsController < ApplicationController
  # protect_from_forgery with: :null_session

  def index
    @transactions = Transaction.where(account_id: params[:account_id])
    render json: @transactions
  end

  def create
    @transaction = Transaction.new(transaction_params)
    @transaction.balance = @transaction.account.balance + @transaction.amount
    
    if @transaction.save
      # Update account balance
      @transaction.account.update(balance: @transaction.balance)
      render json: @transaction, status: :created
    else
      render json: @transaction.errors, status: :unprocessable_entity
    end
  end

  def show
    @transaction = Transaction.find_by(id: params[:id])
    if @transaction
      render json: @transaction
    else
      render json: { error: "Transaction not found" }, status: :not_found
    end
  end

  private

  def transaction_params
    params.require(:transaction).permit(:account_id, :amount)
  end
end
