class ChangeTableNotifications < ActiveRecord::Migration[5.0]
  def change
  	remove_column :user_notifications, :episode_id
  	add_reference :user_notifications, :series, index: true
  end
end
