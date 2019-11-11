class TextField < ApplicationRecord
  belongs_to :card_field
  has_one :card, through: :card_field
end
