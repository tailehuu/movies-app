class MoviesController < ApplicationController
  before_action :authenticate_user!

  def index
    movies = if current_user
               Movie.where(user_id: current_user.id)
             else
               Movie
             end.order('id DESC').page(params[:page] || 1)
    render json: {
      data: ActiveModel::Serializer::CollectionSerializer.new(
        movies,
        each_serializer: MovieSerializer
      ),
      current_page: movies.current_page,
      total_pages: movies.total_pages
    }
  end

  def create
    # TODO
    # - should Scrivener validator to validate params
    # - movie_params[:user_id] should change after doing authentication

    return render json: { message: 'not_authorized' }, status: :unprocessable_entity if current_user.nil?

    movie = Movie.create!(
      title: movie_params[:title],
      description: movie_params[:description],
      link: movie_params[:link],
      user_id: current_user.id
    )

    render json: MovieSerializer.new(movie).as_json
  end

  private

  def movie_params
    params.require(:movie).permit(:title, :description, :link, :user_id)
  end
end
