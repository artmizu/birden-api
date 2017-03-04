class Series < ApplicationRecord
	self.primary_key = "id"
	mount_uploader :video, SeriesUploader
	belongs_to :anime, dependent: :destroy

	has_many :notifications
end
