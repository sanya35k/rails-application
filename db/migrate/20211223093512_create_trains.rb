class CreateTrains < ActiveRecord::Migration[7.0]
  def change
    create_table :trains do |t|
      t.integer :number

      t.timestamps
    end
  end
end
