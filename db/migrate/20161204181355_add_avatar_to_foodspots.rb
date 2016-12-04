class AddAvatarToFoodspots < ActiveRecord::Migration[5.0]
  def change
     add_column :foodspots, :avatar, :string
  end
end
