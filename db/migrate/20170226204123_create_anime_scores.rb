class CreateAnimeScores < ActiveRecord::Migration[5.0]
  def change
    create_table :anime_scores do |t|
    	t.integer :value
    	t.belongs_to :anime
      t.timestamps
    end
  end
end
