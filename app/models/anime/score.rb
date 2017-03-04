class Anime::Score < ApplicationRecord
	belongs_to :anime
	belongs_to :user
end
