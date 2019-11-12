class Card < ApplicationRecord
  belongs_to :world
  has_one :user, through: :world
  has_many :taggings
  has_many :tags, through: :taggings
  has_one :timestamp
  has_one :map
  has_one :coordinate

  validates :world, presence: true

  include PgSearch::Model
  pg_search_scope :search_by_tags,
                  associated_against: {
                    tags: [:name]
                  },
                  using: {
                    tsearch: { prefix: true }
                  }
end
