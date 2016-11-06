class AddAttachmentImageToFoodspots < ActiveRecord::Migration
  def self.up
    change_table :foodspots do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :foodspots, :image
  end
end
