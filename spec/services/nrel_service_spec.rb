require 'rails_helper'

describe NrelService do
  before(:each) do
    @service = NrelService.new
  end

  it 'returns fuel stations in given zip code' do
    VCR.use_cassette('nrel_service#default_fuel_stations') do
      @returned_stations = @service.find_by_default_distance('80203')
      @returned_station = @returned_stations.first

    end

    expect(@returned_stations.length).to eq(1)
    expect(@returned_station.address).to include('80203')
    expect(@returned_station.distance).to eq('6.0 miles')
    expect(@returned_station.fuel_type).to eq('ELEC')
  end
end
