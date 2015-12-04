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
    if params[:note][:tags]
      params[:note][:tag_names] = params[:note].delete :tags
    end
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
          render json: {
            errors: @note.errors,
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

end
