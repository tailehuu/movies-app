class MovieSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :link, :number_votes_up, :number_votes_down, :shared_by, :created_at

  def shared_by
    object.user.email
  end

  def created_at
    object.created_at.to_i
  end
end
