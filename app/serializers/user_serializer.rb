class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :password, :password_confirmation, :image_url, :bio
  has_many :recipes
end
