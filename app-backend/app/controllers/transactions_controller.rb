class TransactionsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create]
    def index
      @transactions = Transaction.all
      render json: @transactions
    end
  
    def create
      @transaction = Transaction.new(transaction_params)
      if @transaction.save
        render json: @transaction, status: :created
      else
        render json: @transaction.errors, status: :unprocessable_entity
      end
    end
  
    private
  
    def transaction_params
      params.require(:transaction).permit(:account_id, :amount, :balance)
    end
  end
  