class Card < ApplicationRecord
  belongs_to :user
  has_many :taggings
  has_many :tags, through: :taggings
  has_many :card_fields
  has_one :timestamp
  has_one :map
  has_one :coordinate

  validates :user, presence: true

  include PgSearch::Model
  pg_search_scope :search_by_tags,
                  associated_against: {
                    tags: [:name]
                  },
                  using: {
                    tsearch: { prefix: true }
                  }
end
