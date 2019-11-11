class LinkField < ApplicationRecord
  belongs_to :card_field
  belongs_to :card, through: :card_field
end
