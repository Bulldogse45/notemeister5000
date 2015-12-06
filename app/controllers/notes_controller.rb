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
    @note = Note.new(note_params)
    if params[:note][:api_token] && find_by_single_access_token(params[:note][:api_token])
      @note.user = find_by_single_access_token(params[:note][:api_token])
      save_note
    elsif !params[:note][:api_token]
      save_note
    else
      respond_to do |format|
        format.json{
          render json: {
            errors: "The token you entered did not match any of our records.",
            status: 400
          }, :status=> 400
        }
      end
    end
  end

  private

  def note_params
    params.require(:note).permit(:title, :body, :tag_names)
  end

  def single_access_allowed?
    action_name == "create"
  end

  def find_by_single_access_token(token)
    User.select{|u| u.api_token == token}.first
  end

  def save_note

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
