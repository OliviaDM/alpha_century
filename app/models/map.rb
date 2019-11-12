class Map < ApplicationRecord
  has_many :coordinates
  belongs_to :world
  has_one :user, through: :world

  validates :image_url, presence: true
  validates :world, presence: true
end
