class Foodspot < ApplicationRecord
  searchkick
  has_many :votes
  belongs_to :category
  acts_as_votable

  # needed for geocoder
  geocoded_by :address
  after_validation :geocode
# needed for paperclip
  has_attached_file :image, styles: { original: "750x500>", thumb: "300x250>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
  validates_attachment_presence :image
  # validates :title, :description, :price, :city_id, :phone, :category_id, presence: true

end
