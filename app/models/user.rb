class User < ActiveRecord::Base

  acts_as_authentic
  before_save :assign_api_token

  has_many :notes

  private

  def assign_api_token
    self.api_token = SecureRandom.hex
  end

end
