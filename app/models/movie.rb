class Movie < ActiveRecord::Base
	validates :movie, presence: true
	validates :year, presence: true

end