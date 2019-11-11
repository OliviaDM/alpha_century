class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :cards
  has_many :tags
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
