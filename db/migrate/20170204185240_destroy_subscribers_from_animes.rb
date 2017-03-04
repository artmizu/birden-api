class DestroySubscribersFromAnimes < ActiveRecord::Migration[5.0]
  def change
  	remove_column :animes, :subscribers
  end
end
