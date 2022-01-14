class ChangeCarriageOrder < ActiveRecord::Migration[7.0]
  def change
    change_column :trains, :sort, :integer
  end
end