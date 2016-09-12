class FuelStation < OpenStruct
  def self.service
    @@service ||= NrelService.new
  end

  def self.return_stations(raw_stations, distance)
    raw_stations.map do |station|
      FuelStation.new(
        name: station['station_name'],
        address: format_address(station),
        fuel_type: format_fuel_type(station['fuel_type_code']),
        distance: "#{distance} miles",
        access_times: station['access_days_time']
      )
    end
  end

  def self.format_address(station)
    "#{station['street_address']}, #{station['city']}, #{station['state']} #{station['zip']}"
  end

  def self.format_fuel_type(type_codes)
    return type_codes if type_codes.is_a?(String)
    type_codes.split(',').map do |type|
      fuel_types[type]
    end
  end

  def self.fuel_types
    { 'BD': 'Biodisel', 'CNG': 'Compressed Natural Gas',
      'E85': 'Ethanol(85)', 'ELEC': 'Electric', 'HY': 'Hydrogen',
      'LNG': 'Liquefied Natural Gas', 'LPG': 'Propane' }
  end
end
