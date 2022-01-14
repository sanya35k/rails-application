class CreateCarriages < ActiveRecord::Migration[7.0]
  def change
    create_table :carriages do |t|
      t.string :type
      t.integer :top_seats
      t.integer :bottom_seats
      t.belongs_to :train

      t.integer :side_top_seats
      t.integer :side_bottom_seats

      t.integer :sitting_seats

      t.integer :number

      t.timestamps
    end

    add_column :trains, :sort, :boolean
    add_column :railway_stations_routes, :number, :integer
  end
end
