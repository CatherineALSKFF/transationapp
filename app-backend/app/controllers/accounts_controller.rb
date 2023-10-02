require 'net/http'

BASE_URL = "https://infra.devskills.app/accounting/api/3.1.0".freeze


class AccountsController < ApplicationController
  
  def show
    account_id = params[:id]
  
    response = send_get_request("/accounts/#{account_id}")
  
    render json: response.body, status: response.code.to_i
  end

  private

def send_get_request(endpoint)
  uri = URI("#{BASE_URL}#{endpoint}")

  http = Net::HTTP.new(uri.host, uri.port)
  http.use_ssl = true

  request = Net::HTTP::Get.new(uri.request_uri)

  http.request(request)
end
end
  
  