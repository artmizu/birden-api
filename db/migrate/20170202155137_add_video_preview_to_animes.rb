class AddVideoPreviewToAnimes < ActiveRecord::Migration[5.0]
  def change
    add_column :animes, :video_preview, :string
  end
end
