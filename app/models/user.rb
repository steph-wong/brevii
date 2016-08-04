class User < ApplicationRecord

has_many :summaries, dependent: :destroy

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

  has_secure_password

  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

end
