require 'nokogiri'
require 'open-uri'
require 'open_uri_redirections'

class Parser #почитать как разделить класс на подмодули. Может быть держать их не в моделях а еще где
	def set_url(url)
		@url = Nokogiri::HTML(open(url))
	end

	def get_title
		@url.at_css("h1").text
	end

	def get_manufacturer
		@url.at_css(".studio-logo").attr('alt')
	end

	def get_anime_type
		@url.at_css(".line-container:nth-child(1) .value").text
	end

	def get_release_date
		@url.at_css(".b-entry-info > .line-container:nth-child(3) .value").text
	end

	def get_description
		@url.at_css(".russian .text").text
	end

	def get_cover
		cover_url = @url.at_css(".c-poster center img").attr('src')
		if !cover_url.include? "http:"
			cover_url = "http:" + cover_url
		end
		open(cover_url, :allow_redirections => :safe ) do |resp|
			cover_url = resp.base_uri.to_s
		end
		return cover_url
	end

	def get_genres
		genres_arr = Array.new
		@url.css(".genre-ru").each do |item|
			genres_arr << item['data-text']
		end
		return genres_arr
	end

	def collect_data(url)
		set_url(url)
		return {
			remote_cover_url: get_cover,
			title: get_title,
			manufacturer: get_manufacturer,
			anime_type: get_anime_type,
			date: get_release_date,
			description: get_description,
			genres: get_genres
		}
	end

	def factory(from, to)
		arr = (from...to).to_a 
		arr.each do |id|
			begin
				url = "https://shikimori.org/animes/" + id
				data = collect_data(url)
				data.delete(:genres)
				new_anime = Anime.new(data)
				get_genres.each do |genre|
					if Genre.exists?(name: genre)
						new_anime.genres << Genre.where(name: genre).first
					else 
						new_anime.genres << Genre.new(name: genre)
					end
				end
				new_anime.save!
			rescue
				puts "ERROR".on_red
			end
		end
	end
end