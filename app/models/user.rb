class User < ApplicationRecord
before_save {email.downcase!}

  EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i

  validates :name,
            presence: true,
            length: {maximum: 50}

  validates :email,
            presence: true,
            uniqueness: { case_senstive: false },
            format: { with: EMAIL_REGEX }

  validates :username,
            presence: true,
            uniqueness: { case_senstive: false }

  validates :password,
            presence: true,
            length: {minimum: 8}

end
