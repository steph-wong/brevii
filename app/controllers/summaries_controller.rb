class SummariesController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]

  def show
    @summary = Summary.find(params[:id])
  end

  def new
    @movie = Enceladus::Movie.find(params[:id])
    @summary = Summary.new(:movie_id => params[:id])
  end

  def create
    @movie = movie.id
    @summary = @movie.summaries.build(summary_params)
    @summary.user = current_user
    @summary.save

    if @summary.save
      flash[:success] = "Summary created!"
      redirect_to movies_url
    else
      redirect_to movies_url
    end
  end

  def destroy
  end

  private

    def summary_params
      params.require(:summary).permit(:content)
    end

end
