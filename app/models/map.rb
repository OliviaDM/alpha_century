class Map < ApplicationRecord
  belongs_to :card
  has_many :coordinates

  validates :card, presence: true
  validates :image_url, presence: true
end
