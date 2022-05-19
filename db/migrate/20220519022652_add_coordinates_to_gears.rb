class AddCoordinatesToGears < ActiveRecord::Migration[6.1]
  def change
    add_column :gears, :latitude, :float
    add_column :gears, :longitude, :float
  end
end
