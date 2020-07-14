class User < ApplicationRecord

  has_secure_password
  validates :email, presence: true, uniqueness: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP } 
  validates :username, presence: true, length: { minimum: 4 }

  has_many :events

end
