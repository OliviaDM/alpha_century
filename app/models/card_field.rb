class CardField < ApplicationRecord
  belongs_to :card
  has_one :text_field
  has_one :image_field
  has_one :link_field
end
