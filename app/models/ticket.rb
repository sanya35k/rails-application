class Ticket < ApplicationRecord
  belongs_to :user
  belongs_to :train
  belongs_to :first_station, class_name: 'TrainStation', foreign_key: :first_station_id
  belongs_to :last_station, class_name: 'TrainStation', foreign_key: :last_station_id
end