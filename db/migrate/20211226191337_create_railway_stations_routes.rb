class CreateRailwayStationsRoutes < ActiveRecord::Migration[7.0]
  def change
    create_table :railway_stations_routes do |t|
      t.belongs_to :railway_station, index: true
      t.belongs_to :route, index: true
    end
  end
end
