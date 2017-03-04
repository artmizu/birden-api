require 'streamio-ffmpeg'
# Посмотреть, можно ли красивее сделать модель 
class VideoEncode
	def initialize(source, id)
		@source_path = source
		@source = FFMPEG::Movie.new(source)
		@id = id
	end

	def duration
		@source.resolution
	end

	def thumb
		path = generate_path("thumb")
		options = {
			custom: %w{-vf crop=145:82} 
		}
		screen = @source.transcode(path, resolution: '145x82')
		return path.gsub('public/', '')
	end

	def cover
		path = generate_path("cover")
		screen = @source.screenshot(path, resolution: '1000x550') do |progress| 
			puts "#{progress * 100}%"
		end
		return path.gsub('public/', '')
	end

	def video_preview
		path = video_preview_path
		options = {
			custom: %w{-vf scale=-1:295,crop=210:295 -t 10 -an} 
		}
		@source.transcode(path, options)
		return path.gsub('public/', '')
	end

	private
	def generate_path(type)
		path = "public/uploads/series/#{type}s/#{@id}/"
		system 'mkdir', '-p', path
		path = path + "#{type}.jpg"
		return path
	end

	def video_preview_path
		path = "public/uploads/anime/video_preview/#{@id}/"
		system 'mkdir', '-p', path
		path = path + "preview.mp4"
		return path
	end
end
