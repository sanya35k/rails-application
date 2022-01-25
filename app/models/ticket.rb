class Ticket < ApplicationRecord
  validates :first_name, :last_name, :passport_number, :first_station, :last_station, presence: true
  validate :same_stations?

  belongs_to :user
  belongs_to :train
  belongs_to :first_station, class_name: 'RailwayStation', foreign_key: :first_station_id
  belongs_to :last_station, class_name: 'RailwayStation', foreign_key: :last_station_id

  private

  def same_stations?
    errors.add(:first_station, ' - first station cannot be equal to last station!') if first_station == last_station
  end
end