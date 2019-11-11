class Coordinate < ApplicationRecord
  belongs_to :card
  belongs_to :map
end
