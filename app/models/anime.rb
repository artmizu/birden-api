require 'nokogiri'
require 'open-uri'

class Anime < ApplicationRecord
	self.primary_key = "id"

	mount_uploader :cover, CoverUploader
	
	has_many :item_lists #через них жанры соединяются
	has_many :genres, through: :item_lists
	
	has_many :series

	has_many :subscriptions
	has_many :users, through: :subscriptions

	has_many :scores

end