class User < ApplicationRecord
  has_secure_password
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  
  validates :email, presence: true, length: { maximum: 255 },

                    format: { with: VALID_EMAIL_REGEX },

                    uniqueness: { case_sensitive: false }

  validates :password_digest, presence: true, length: { minimum: 4 }

  class << self
    attr_accessor :currentUserId
  end
end
