class TagSerializer < ActiveModel::Serializer
  attributes :name

  has_many :notes, serializer: NoteSerializer

end
