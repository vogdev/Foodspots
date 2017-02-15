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
  scope :VisibleFoodspots, ->{ where(visible: true).order(cached_votes_total: :desc, created_at: :desc) }
  scope :PopularFoodspots, ->(page){where(visible: true).paginate(:page => page, :per_page => 6).order(cached_votes_total: :desc, created_at: :desc)}

end
