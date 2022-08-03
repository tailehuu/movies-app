class SignedInUserSerializer < ActiveModel::Serializer
  attributes :id, :email, :jwt_token, :created_at

  def jwt_token
    'sample-jwt-token'
  end
end
