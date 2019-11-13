class Timestamp < ApplicationRecord
  belongs_to :card
  belongs_to :timestamp

  validates :card, presence: true
end
