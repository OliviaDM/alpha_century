class Tag < ApplicationRecord
  belongs_to :world
  has_one :user, through: :world
  has_many :taggings
  has_many :cards, through: :taggings

  validates :world, presence: true
  validates :name, presence: true, allow_blank: false
end
