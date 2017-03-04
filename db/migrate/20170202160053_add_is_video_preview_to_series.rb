class AddIsVideoPreviewToSeries < ActiveRecord::Migration[5.0]
  def change
    add_column :series, :is_video_preview, :boolean, default: false
  end
end
