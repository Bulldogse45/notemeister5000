class DeleteTaggingIdFromNotes < ActiveRecord::Migration
  def change

    remove_column :notes, :tagging_id

  end
end
