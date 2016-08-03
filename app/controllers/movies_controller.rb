class MoviesController < ApplicationController

  $popular_movies = Enceladus::Movie.popular

  def index
    @movies = $popular_movies.all
  end

  def show
    @movie = Enceladus::Movie.find(params[:id])
  end

end

def self.find(id)
  build_single_resource(Enceladus::Requester.get("movie/#{id}", default_params))
end
