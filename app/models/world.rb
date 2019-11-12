class World < ApplicationRecord
  belongs_to :user
  has_many :cards
  has_many :tags

  validates :user, presence: true
  validates :name, presence: true, allow_blank: false

  mount_uploader :photo, PhotoUploader

end
