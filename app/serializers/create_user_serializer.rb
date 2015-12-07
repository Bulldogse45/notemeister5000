class CreateUserSerializer < ActiveModel::Serializer
  attributes  :email, :api_token
end
