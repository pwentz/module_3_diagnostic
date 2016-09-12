class SearchController < ApplicationController
  def index
    get_connection.body
  end

  private

  def get_connection
    @connection = Faraday.new('https://api.data.gov/nrel/alt-fuel-stations/v1.json')
    @connection.params['api_key'] = ENV['nrel_key']
    @connection.params['location'] = params['q']
    response = @connection.get
  end
end
