require 'test_helper'

class NoteTest < ActiveSupport::TestCase
  include FactoryGirl::Syntax::Methods
  # test "the truth" do
  #   assert true
  # end
  test "create_note" do
    note = build(:note)
    note.save
    assert note.persisted?
  end

  test "fields_saved" do
    note = build(:note, :title => "Test Title", :body => "This is the song that never ends!")
    note.save
    assert note.title == "Test Title"
    assert note.body == "This is the song that never ends!"
  end

  test "missing_title" do
    note = build(:note, :title => "")
    note.save
    assert_not note.persisted?
  end

  test "missing_body" do
    note = build(:note, :body => "")
    note.save
    assert_not note.persisted?
  end

end
