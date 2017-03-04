class ModifyScoreTable < ActiveRecord::Migration[5.0]
  def change
  	add_reference :anime_scores, :user, index: true
  end
end
