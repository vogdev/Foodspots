class Foodspot < ApplicationRecord
  mount_uploader :avatar, FoodspotUploader
  searchkick
  has_many :votes
  belongs_to :category
  acts_as_votable
  # needed for geocoder
  geocoded_by :address
  after_validation :geocode

  # validates :title, :description, :price, :city_id, :phone, :category_id, presence: true

end
