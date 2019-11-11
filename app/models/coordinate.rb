class Coordinate < ApplicationRecord
  belongs_to :card
  belongs_to :map

  validates :map, presence: true
  validates :card, presence: true
  validates :lat, presence: true
  validates :long, presence: true
end
