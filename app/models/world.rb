class World < ApplicationRecord
  belongs_to :user
  has_many :cards, dependent: :destroy
  has_many :tags, dependent: :destroy

  validates :user, presence: true
  validates :name, presence: true, allow_blank: false

  mount_uploader :photo, PhotoUploader

end
