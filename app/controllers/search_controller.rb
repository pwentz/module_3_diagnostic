class SearchController < ApplicationController
  def index
    nrel = NrelService.new
    @fuel_stations = nrel.find_by_default_distance(params['q'])
  end
end
