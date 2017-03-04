class ChangeAnimeColumnName < ActiveRecord::Migration[5.0]
  def change
  	rename_column :animes, :animeType, :anime_type
  end
end
