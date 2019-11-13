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
                  }

  def tag_search(tag_array)
    cards = Card.all
    tag_array.each do |tag|
      sub_cards = Card.search_by_tags(tag)
      cards = cards & sub_cards
    end
    cards
  end


end
