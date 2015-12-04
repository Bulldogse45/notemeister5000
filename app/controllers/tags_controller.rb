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

  def show
    @tag = Tag.select{|t| t.name == params[:name]}.first
    respond_to do |format|
      format.json{
        render json: @tag, serializer: TagSerializer
      }
    end
  end

  private

  def tag_params
    params.permit(:name)
  end

end
