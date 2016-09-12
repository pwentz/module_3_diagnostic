class NrelService
  def initialize
    @connection = Faraday.new('https://api.data.gov/nrel/alt-fuel-stations/v1.json')
    @connection.params['api_key'] = ENV['nrel_key']
    @connection.params['limit'] = 10
  end

  def find_by_default_distance(zip, distance = 6.0)
    @connection.params['radius'] = distance
    @connection.params['zip'] = zip
    @connection.params['fuel_type'] = 'ELEC, LPG'
    response = @connection.get
    fuel_stations = parse(response.body)['fuel_stations']
    FuelStation.return_stations(fuel_stations, distance)
  end

  private

  def parse(body)
    JSON.parse(body)
  end
end
