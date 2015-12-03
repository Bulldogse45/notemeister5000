class NoteSerializer < ActiveModel::Serializer
  attributes :title, :body, :tags

end
