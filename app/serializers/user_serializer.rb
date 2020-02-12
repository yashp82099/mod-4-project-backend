class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :last_name, :first_name, :zip 
end
