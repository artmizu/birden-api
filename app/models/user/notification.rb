class User::Notification < ApplicationRecord
	belongs_to :user
	belongs_to :series
end
