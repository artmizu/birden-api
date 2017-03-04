class AnimeSerializer < ActiveModel::Serializer
  attributes :id, :cover, :title, :manufacturer, :anime_type, :date, :description, :video_preview
  has_many :genres
  has_many :series
  has_many :subscriptions
end
