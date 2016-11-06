class CreateFoodspots < ActiveRecord::Migration[5.0]
  def change
    create_table :foodspots do |t|
      t.string :name
      t.string :phone
      t.integer :category_id
      t.string :address
      t.string :website
      t.boolean :visible , default: false

      t.timestamps
    end
  end
end
