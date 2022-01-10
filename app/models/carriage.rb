class Carriage < ApplicationRecord
  validates :carriage_type, presence: true
  validates :top_seats, presence: true
  validates :bottom_seats, presence: true

  belongs_to :train
end
