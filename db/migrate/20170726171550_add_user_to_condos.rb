class AddUserToCondos < ActiveRecord::Migration[5.1]
  def change
    add_reference :condos, :user, foreign_key: true
  end
end
