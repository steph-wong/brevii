 class MoviesController < ApplicationController

  $popular_movies = Enceladus::Movie.popular

  def index
    @movies = $popular_movies.all
  end

  def show
    @movie = Enceladus::Movie.find(params[:id])
    @summary = current_user.summaries.build if logged_in?
    @sum_list = Summary.find_by(movie_id: @movie.id)
  end

end
