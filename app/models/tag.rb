class Tag < ApplicationRecord
  belongs_to :user
  has_many :taggings
  has_many :cards, through: :taggings

  validates :user, presence: true
  validates :name, presence: true, allow_blank: false
end
