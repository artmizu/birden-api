class RenameNotificationToUserNotification < ActiveRecord::Migration[5.0]
  def change
  	rename_table :notifications, :user_notifications
  end
end
