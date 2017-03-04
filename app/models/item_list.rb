class ItemList < ApplicationRecord
	self.primary_key = "id"
	
	belongs_to :anime
	belongs_to :genre
end
