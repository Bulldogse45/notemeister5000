class NoteSerializer < ActiveModel::Serializer
  attributes :title, :body, :created_at, :updated_at

  has_one :user, only: :email

  has_many :tags, only: [:name]

end
