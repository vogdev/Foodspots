class AddLatitudeAndLongitudeToFoodspot < ActiveRecord::Migration[5.0]
  def change
    add_column :foodspots, :latitude, :float
    add_column :foodspots, :longitude, :float
  end
end
