class CreateNotifications < ActiveRecord::Migration[5.0]
  def change
    create_table :notifications do |t|
    	t.belongs_to :user, index: true
    	t.belongs_to :anime, index: true
    	t.boolean :is_watch, default: false
		t.timestamps
    end
  end
end
