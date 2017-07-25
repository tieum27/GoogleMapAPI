class AddPaperclipToCondos < ActiveRecord::Migration[5.1]
  def change
    add_attachment :condos, :image #add this line
  end
end
