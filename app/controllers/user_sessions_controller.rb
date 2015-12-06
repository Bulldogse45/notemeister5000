class UserSessionsController < ApplicationController

  def create
    @user_session = UserSession.new(user_session_params)
    if @user_session.save
    else
      respond_to do |format|
        format.json{
          render json: @user_session.errors
        }
      end
    end
  end

  private

  def user_session_params
    params.permit(:api_token)
  end

end
