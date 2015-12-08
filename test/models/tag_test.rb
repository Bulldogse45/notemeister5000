require 'test_helper'

class TagTest < ActiveSupport::TestCase
  include FactoryGirl::Syntax::Methods
  # test "the truth" do
  #   assert true
  # end

  test "downcase_tag" do
    note = create(:note, :tag_names =>"TAG, TeSt")
    assert note.tags.first.name == "tag", message:"all caps didnt work"
    assert note.tags[1].name == "test", message:"some caps didnt work"
  end

  test "strip_tag" do
    note = create(:note, :tag_names =>"    tag   , test  ")
    assert note.tags.first.name == "tag", message:"strip didnt work"
    assert note.tags[1].name == "test", message:"strip 2 didnt work"
  end

  test "no_spaces" do
    note = create(:note, :tag_names =>"    t a g , t e s t  ")
    puts note.tags.first.name
    assert note.tags.first.name == "t_a_g", message:"no spaces didnt work"
    assert note.tags[1].name == "t_e_s_t", message:"no spaces 2 didnt work"
  end

  test "no_symbolss" do
    note = create(:note, :tag_names =>"    t#a*g , t$e%s&t  ")
    puts note.tags.first.name
    assert note.tags.first.name == "tag", message:"no spaces didnt work"
    assert note.tags[1].name == "test", message:"no spaces 2 didnt work"
  end

end
