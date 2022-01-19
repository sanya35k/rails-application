class Route < ApplicationRecord
  validates :title, presence: true

  has_many :railway_stations_routes
  has_many :railway_stations, through: :railway_stations_routes
  has_many :trains

  def self.find_route(from, to)
    routes = []

    if (from && to)
      station_from = RailwayStation.find(from)
      station_to = RailwayStation.find(to)

      Route.all.each do |route|
        if route.railway_stations.include?(station_from) &&
          route.railway_stations.include?(station_to) &&
          #station_from.position_in(route) < station_to.position_in(route)

          routes.push({ route: Route.find(route.id), departure_station: station_from, arrival_station: station_to })
        end
      end
    end

    routes
  end
end