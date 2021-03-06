class User < ApplicationRecord
  has_many :resources_posted, class_name: "Resource", foreign_key: :author_id
  has_many :favorites, foreign_key: :fan_id
  has_many :resources_favorited, through: :favorites, source: :resource

  validates :first_name, :last_name, :email, :user_type, presence: true
  validates :email, uniqueness: true

  has_secure_password
end
