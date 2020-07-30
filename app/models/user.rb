class User < ApplicationRecord

  has_secure_password
  validates :email, presence: true, uniqueness: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP } 
  validates :username, presence: true, length: { minimum: 4 }, uniqueness: true

  has_many :events, dependent: :destroy
  has_many :favorites
  has_many :favorited_events, through: :favorites, source: :event

end
