class DefaultCarriage < Carriage
  validates :bottom_seats, :top_seats, :side_bottom_seats, :side_top_seats, presence: true
end
