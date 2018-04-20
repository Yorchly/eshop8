class AddCoverImageAttachmentToProgram < ActiveRecord::Migration
  def up
    add_attachment :programs, :cover_image
  end

  def down
    remove_attachment :programs, :cover_image
  end
end
