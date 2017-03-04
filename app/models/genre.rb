class Genre < ApplicationRecord
	self.primary_key = "id"
	
	has_many :item_lists
	has_many :animes, through: :item_lists
end
