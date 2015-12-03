class NotesController < ApplicationController
  include ActionController::MimeResponds
  include ActionController::Serialization

  def index
    @notes = Note.all
    respond_to do |format|
      format.json{
        render json: @notes
      }
    end
  end


  def create
    params[:note][:tag_names] = params[:note].delete :tags
    @note = Note.new(note_params)
    if @note.save
      respond_to do |format|
        format.json{
          render json: @note, serializer: NoteSerializer
        }
      end
    else
      respond_to do |format|
        format.json{
          render json: @note.errors
        }
      end
    end
  end

  private

  def note_params
    params.require(:note).permit(:title, :body, :tag_names)
  end

end
