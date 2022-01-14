class Train < ApplicationRecord
  validates :number, :sort, presence: true

  belongs_to :route
  has_many :tickets
  belongs_to :current_station, class_name: 'RailwayStation', foreign_key: :current_station_id

  has_many :carriages, ->(train) { order(train.sort == 1 ? :number : 'number DESC') }

  def count_seats(carriage_type, seat_type)
    carriages.where(type: carriage_type).sum(seat_type)
  end
end
