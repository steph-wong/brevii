class User < ApplicationRecord

  EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i

  validates :name, :email, presence: true
  validates :email, format: { with: EMAIL_REGEX }
  validates :email, confirmation: true
  validates :email_confirmation, presence: true

end
