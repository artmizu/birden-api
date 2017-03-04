class NotificationSystem < ActiveRecord::Migration[5.0]
  def change
  	remove_column :notifications, :is_watch 
  	rename_table :notifications, :subscriptions

  	create_table :notifications do |t|
  		t.belongs_to :user
  		t.boolean :is_watch, default: false
  		t.integer :episode_id
  	end
  end
end
