class AccountsController < ApplicationController
  def show
    @account = Account.find_by(account_id: params[:account_id])

    if @account
      @transactions = @account.transactions
      render json: { account: @account, transactions: @transactions }
    else
      render json: { error: "Account not found" }, status: :not_found
    end
  end
end