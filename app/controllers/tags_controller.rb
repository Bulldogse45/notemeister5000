class TagsController < ApplicationController

  include ActionController::MimeResponds
  include ActionController::Serialization

  def create
    @tag = Tag.new(tag_params)
    if @tag.save
    else
      freak_out
    end
  end

  private

  def tag_params
    params.permit(:name)
  end

end
