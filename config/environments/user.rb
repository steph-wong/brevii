class User < ApplicationRecord

  EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i

  validates :name, :email, :username, :password presence: true
  validates :email, :username, uniqueness: true
  validates :email, format: { with: EMAIL_REGEX }
  validates :password, :length => { :minimum => 8 }

end
