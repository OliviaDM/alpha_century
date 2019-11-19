class Card < ApplicationRecord
  belongs_to :world
  has_one :user, through: :world
  has_many :taggings, dependent: :destroy
  has_many :tags, through: :taggings
  has_one :timestamp
  has_one :map
  has_many :coordinates, dependent: :destroy

  validates :world, presence: true

  include PgSearch::Model
  pg_search_scope :search_by_tags,
                  associated_against: {
                    tags: [:name]
                  }

  def self.tag_search(tag_array)
    cards = Card.all
    tag_array.each do |tag|
      sub_cards = Card.search_by_tags(tag)
      cards = cards & sub_cards
    end
    cards
  end

  def self.events_tag_search(tag_array)
    Card.where(is_event: true) & Card.tag_search(tag_array)
  end

  def clean_content
    reg = /^<figure data-trix-attachment="(.)+<\/span><\/figcaption><\/a><\/figure>$/
    self.content.gsub(reg, "")
  end

  def img_content(card_width)
    reg = /<img src="([^ ]+)" width="(\d+)" height="(\d+)">/
    if match = self.content.scan(reg)
      new_string = self.content
      match.each do |match|
        new_string.gsub!(match[0] + "\" width=\"#{match[1]}\" height=\"#{match[2]}\"", match[0] + "\" width=\"#{card_width}\"")
      end
      return new_string
    end
  end

end
