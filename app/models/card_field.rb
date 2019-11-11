class CardField < ApplicationRecord
  belongs_to :card
  has_one :text_field
  has_one :image_field
  has_one :link_field

  validates :order, presence: true
  validates :card, presence: true
  validates :content_type, presence: true, inclusion: { in: ["text", "image", "link"] }
end
