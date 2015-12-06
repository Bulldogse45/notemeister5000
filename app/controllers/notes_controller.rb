class NotesController < ApplicationController
  include ActionController::MimeResponds
  include ActionController::Serialization

  protect_from_forgery :except=>:create

  def index
    @notes = Note.all
    respond_to do |format|
      format.json{
        render json: @notes
      }
    end
  end


  def create
    if params[:note][:tags]
      params[:note][:tag_names] = params[:note].delete :tags
    end
    if params[:note][:api_token]
      if find_by_single_access_token(params[:note][:api_token])
        params[:note][:user_id] = find_by_single_access_token(params[:note][:api_token]).id
        save_note
      else
        respond_to do |format|
          format.json{
            render json: "The User information you provided did not match any user"
          }
        end
      end
    else
      save_note
    end

  end

  private

  def note_params
    params.require(:note).permit(:title, :body, :tag_names, :user_id)
  end

  def single_access_allowed?
    action_name == "create"
  end

  def find_by_single_access_token(token)
    User.select{|u| u.api_token == token}.first
  end

  def save_note
    @note = Note.new(note_params)
    if @note.save
      if current_user_session
        @note.update(user_id: current_user.id)
      end
      respond_to do |format|
        format.json{
          render json: @note, serializer: NoteSerializer
        }
      end
    else
      respond_to do |format|
        format.json{
          render json: {
            errors: @note.errors,
            status: 400
          }, :status=> 400
        }
      end
    end
  end

end
