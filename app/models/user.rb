class User < ApplicationRecord
  has_secure_password
  validates :username, presence: true, length: { minimum: 5, maximum: 20 }, uniqueness: true
  validates :password, length: { minimum: 5, maximum: 20 }
end
