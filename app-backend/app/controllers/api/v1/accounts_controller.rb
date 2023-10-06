class Api::V1::AccountsController < ApplicationController
  before_action :set_account, only: %i[ show update destroy ]


  def index
    @accounts = Account.all
    render json: @accounts
  end

  def show
    @account = Account.find(params[:id])
    render json: @account
  end

  def update
    @account = Account.find(params[:id])
  
    # Validate the transaction request
    transaction_request = JSON.parse(request.body.read)
    if transaction_request['amount'].nil? || transaction_request['amount'].zero?
      render json: { error: 'Invalid transaction amount' }, status: 400
      return
    end
  
    # Update the account balance
    @account.update(balance: @account.balance.to_i + transaction_request['amount'].to_f.round.to_i)
  
    # Render the updated account data
    render json: @account
  end
  
  
  
  
  
  



  private

  def set_account
    @account = Account.find(params[:id]) 
  end
end