class Category < ApplicationRecord
  has_many :foodspots, dependent: :destroy
end
