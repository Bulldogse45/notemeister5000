require 'test_helper'

class UserTest < ActiveSupport::TestCase
  include FactoryGirl::Syntax::Methods

  # test "the truth" do
  #   assert true
  # end

  test "api_token_created" do
    user = create(:user)
    assert user.api_token != nil
  end

  test "missing_email" do
    user = build(:user, :email => "")
    user.save
    assert_not user.persisted?
  end

end
