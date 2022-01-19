class AddTrainIdToTickets < ActiveRecord::Migration[7.0]
  def change
    add_belongs_to :tickets, :train
  end
end
