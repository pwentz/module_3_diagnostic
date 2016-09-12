require 'rails_helper'

describe NrelService do
  before(:each) do
    @service = NrelService.new
  end

  it 'returns fuel stations in given zip code' do
    VCR.use_cassette('nrel_service#default_fuel_stations') do
      returned_stations = @service.find_by_default_distance('80203', 6.0)
      returned_station = returned_stations.first
      require 'pry'; binding.pry
    end
  end
end
