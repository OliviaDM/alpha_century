class Timelink < ApplicationRecord
  belongs_to :parent_event, class_name: "Card"
  belongs_to :child_event, class_name: "Card"

  validates :parent_event, presence: true
  validates :child_event, presence: true

end
