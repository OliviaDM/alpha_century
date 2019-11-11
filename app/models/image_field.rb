class ImageField < ApplicationRecord
  belongs_to :card_field
  has_one :card, through: :card_field

  validates :card_field, presence: true
  validates :image_url, presence: true
end
