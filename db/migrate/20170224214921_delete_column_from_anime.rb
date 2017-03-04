class DeleteColumnFromAnime < ActiveRecord::Migration[5.0]
  def change
  	remove_column :animes, :genres
  end
end
