class MovieSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :link, :shared_by, :created_at

  def shared_by
    object.user.email
  end
end
