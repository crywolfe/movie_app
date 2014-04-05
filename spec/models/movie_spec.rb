require "spec_helper"
# require_relative "../app/models/movie.rb"



describe Movie do

  it { should validate_presence_of(:movie) }
  it { should validate_presence_of(:year) }

end