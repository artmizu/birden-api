class User < ApplicationRecord
	self.primary_key = "id"
	has_secure_password

	has_many :notifications

	has_many :subscriptions
	has_many :animes, through: :subscriptions
	has_many :scores
end
