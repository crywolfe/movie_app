class MoviesController < ApplicationController

	def index
		@movies = Movie.all
	end

	def create
		@movie = Movie.create(strong_params)

		if @movie.save
			flash[:notice] = "Yeah"
			redirect_to(movies_path)
		else
			flash[:error] = "You made a mistake.  Please enter info again."
			render(:new)
		end
	end

	def new #brings in a new form
		@movie = Movie.new
	end


	def show #shows the new
		@movie = Movie.find(params[:id])

		imdb_query = "http://www.omdbapi.com/?i=&t=#{@movie.title}"

		response = HTTParty.get(imdb_query)
		@json_items = JSON.parse(response)





	end

	def edit #brings in an edit form
		@movie = Movie.find(params[:id])
	end

	def update #updates (like create)
		#find an existing object
		@movie = Movie.find(params[:id])

		if @movie.update_attributes(strong_params)

			redirect_to(:action => "show", :id => @movie.id)
		else
			flash[:error] = "You made a mistake.  Please enter info again."
			render(:edit)
		end


	end

	def destroy
		@movie = Movie.find_by(id: params[:id])
		@movie.destroy
		redirect_to(movies_path)

	end

	private

	def strong_params
		params.require(:movie).permit(:title, :year)

	end

end