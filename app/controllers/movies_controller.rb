class MoviesController < ApplicationController
  def index
    # TODO: should use Serializer + pagination
    render json: { data: Movie.order('id DESC') }
  end

  def create
    # TODO
    # - should Scrivener validator to validate params
    # - movie_params[:user_id] should change after doing authentication
    movie = Movie.create!(
      title: movie_params[:title],
      description: movie_params[:description],
      link: movie_params[:link],
      user_id: movie_params[:user_id]
    )

    render json: movie
  end

  private

  def movie_params
    @movie_params ||= params.require(:movie).permit(:title, :description, :link, :user_id)
  end
end
