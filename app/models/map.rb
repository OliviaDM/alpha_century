class Map < ApplicationRecord
  has_many :coordinates, dependent: :destroy
  belongs_to :world
  has_one :user, through: :world

  validates :photo, presence: true
  validates :world, presence: true

  mount_uploader :photo, PhotoUploader
end
