class User < ApplicationRecord
    validates :email, uniqueness: true, presence: true

    validates_confirmation_of :password
    validates_presence_of :password_digest, require: true
    has_secure_password

    validates :api_key, uniqueness: true, presence: true
    has_secure_token :api_key
  end