class Tagging < ApplicationRecord
  belongs_to :tag
  belongs_to :card

  validates :tag, presence: true
  validates :card, presence: true
end
