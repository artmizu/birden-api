class User::NotificationSerializer < ActiveModel::Serializer
  attributes :id, :is_watch
  belongs_to :series
end