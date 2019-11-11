class Map < ApplicationRecord
  belongs_to :card
  has_many :coordinates
end
