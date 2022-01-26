class Ticket < ApplicationRecord
  validates :first_name, :last_name, :passport_number, :first_station, :last_station, presence: true
  validate :same_stations?

  belongs_to :user
  belongs_to :train
  belongs_to :first_station, class_name: 'RailwayStation', foreign_key: :first_station_id
  belongs_to :last_station, class_name: 'RailwayStation', foreign_key: :last_station_id

  after_create :send_email

  private

  def same_stations?
    errors.add(:first_station, " - first station can't be equal to last station!") if first_station == last_station
  end

  def send_email
    TicketsMailer.buy_ticket(self.user, self).deliver_now
  end
end