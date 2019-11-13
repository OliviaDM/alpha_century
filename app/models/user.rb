class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :worlds
  has_many :cards, through: :worlds
  has_many :tags, through: :worlds
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
