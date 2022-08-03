class MoviesController < ApplicationController
  def index
    # TODO: should use Serializer + pagination
    render json: { data: Movie.all }
  end
end
