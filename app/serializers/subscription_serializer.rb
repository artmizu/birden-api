class SubscriptionSerializer < ActiveModel::Serializer
  attributes :id
  belongs_to :anime
  belongs_to :user
end
