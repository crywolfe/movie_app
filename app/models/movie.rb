class Movie < ActiveRecord::Base
	validates :title, presence: true
	validates :year, presence: true

	def movie_search
		movie_sub = self.title.gsub(" ", "+")
		imdb_query = "http://www.omdbapi.com/?i=&t=#{movie_sub}"
		response = HTTParty.get(imdb_query)
		JSON.parse(response)
	end


end