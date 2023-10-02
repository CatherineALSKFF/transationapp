# transactions_controller.rb
require 'openapi_client'

require 'net/http'

class TransactionsController < ApplicationController
  BASE_URL = "https://infra.devskills.app/accounting/api/3.1.0"
  def create
    transaction_request = params.require(:transaction).permit(:account_id, :amount)
  
    # Create a new OpenAPI client.
    client = OpenApiClient.new(base_url: 'https://infra.devskills.app/accounting/api/3.1.0')
  
    # Create a new transaction.
    transaction = client.create_transaction(transaction_request)
  
    # Render the transaction as JSON.
    render json: transaction, status: :created
  end
  def index
    # Create a new OpenAPI client.
    client = OpenApiClient.new(base_url: 'https://infra.devskills.app/accounting/api/3.1.0')
  
    # Get all transactions.
    transactions = client.get_transactions
  
    # Render the transactions as JSON.
    render json: transactions
  end

  def show
    transaction_id = params[:id]
  
    # Create a new OpenAPI client.
    client = OpenApiClient.new(base_url: 'https://infra.devskills.app/accounting/api/3.1.0')
  
    # Get the transaction by ID.
    transaction = client.get_transaction(transaction_id)
  
    # Render the transaction as JSON.
    render json: transaction
  end


  class OpenApiClient
    attr_reader :base_url
  
    def initialize(base_url:)
      @base_url = base_url
    end
  
    def create_transaction(transaction_request)
      response = post('/transactions', transaction_request.to_json)
      JSON.parse(response.body, symbolize_names: true)
    end
  
    def get_transactions
      response = get('/transactions')
      JSON.parse(response.body, symbolize_names: true)
    end
  
    def get_transaction(transaction_id)
      response = get("/transactions/#{transaction_id}")
      JSON.parse(response.body, symbolize_names: true)
    end
  
    private
  
    def post(path, body)
      uri = URI("#{@base_url}#{path}")
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true
  
      request = Net::HTTP::Post.new(uri.request_uri, 'Content-Type' => 'application/json')
      request.body = body
  
      http.request(request)
    end
  
    def get(path)
      uri = URI("#{@base_url}#{path}")
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true
  
      request = Net::HTTP::Get.new(uri.request_uri)
  
      http.request(request)
    end
  end
  
  



