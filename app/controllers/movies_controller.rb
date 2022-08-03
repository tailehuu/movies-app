class MoviesController < ApplicationController
  def index
    # TODO: should use Serializer + pagination
    movies = Movie.order('id DESC')
    render json: {
      data: ActiveModel::Serializer::CollectionSerializer.new(
        movies,
        each_serializer: MovieSerializer
      )
    }
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

    render json: MovieSerializer.new(movie).as_json
  end

  private

  def movie_params
    params.require(:movie).permit(:title, :description, :link, :user_id)
  end
end
