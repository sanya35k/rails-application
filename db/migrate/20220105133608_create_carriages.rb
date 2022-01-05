class CreateCarriages < ActiveRecord::Migration[7.0]
  def change
    create_table :carriages do |t|
      t.string :carriage_type
      t.integer :top_seats
      t.integer :bottom_seats
      t.belongs_to :train

      t.timestamps
    end
  end
end
