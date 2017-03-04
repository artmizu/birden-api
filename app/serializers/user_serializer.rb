class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :is_admin
  has_many :subscriptions
  has_many :notifications
end