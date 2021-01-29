class User < ApplicationRecord
	include GlobalID::Identification
	has_many :twitter_accounts, dependent: :destroy
	has_secure_password
	validates :email, presence: true, format: { with: /\A[^@\s]+@[^@\s]+\z/, message: "you must use a valid email address" }
	validates_presence_of :password
end
