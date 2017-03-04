class SeriesSerializer < ActiveModel::Serializer
  attributes :id, :video, :number, :thumb, :cover, :is_video_preview
end
