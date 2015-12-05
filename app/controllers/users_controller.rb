class UsersController < ApplicationController

  include ActionController::MimeResponds

  def create
    @user = User.new(user_params)
    @user.api_token = SecureRandom.hex
    if @user.save
      respond_to do |format|
        format.json {
          render json: @user
        }
      end
    else
      respond_to do |format|
        format.json{
          render json: {
            errors: @user.errors,
            status: 400
          }, :status=> 400
        }
      end
    end
  end

  private

  def user_params
    params.permit(:email)
  end

end
