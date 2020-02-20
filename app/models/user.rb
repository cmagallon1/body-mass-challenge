class User < ApplicationRecord
  has_secure_password
  validates :username, presence: true, length: { minimum: 5, maximum: 20 }, uniqueness: true
  validates :password, length: { minimum: 5, maximum: 20 }
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP } 
end
