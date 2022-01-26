class RailwayStation < ApplicationRecord
  validates :title, presence: true

  has_many :trains
  has_many :railway_stations_routes
  has_many :routes, through: :railway_stations_routes

  scope :ordered, -> { select('railway_stations.*, railway_stations_routes.number').joins(:railway_stations_routes).order("railway_stations_routes.number").uniq }

  def update_position(route, position)
    station_route = station_route(route)
    station_route.update(number: position) if station_route
  end

  def position_in(route)
    station_route(route).try(:number)
  end

  def update_time(route, departure_time, arrival_time)
    station_route = station_route(route)
    station_route.update(departure_time: departure_time, arrival_time: arrival_time) if station_route
  end

  def departure_time_in(route)
    station_route(route).try(:departure_time)
  end

  def arrival_time_in(route)
    station_route(route).try(:arrival_time)
  end

  private

  def station_route(route)
    @station_route = railway_stations_routes.where(route: route).first
  end
end
