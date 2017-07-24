class CreateCondos < ActiveRecord::Migration[5.1]
  def change
    create_table :condos do |t|
      t.string :name
      t.string :location
      t.string :latittude
      t.string :longitude
      t.string :city
      t.string :state
      t.string :country
      t.string :zip_code
      t.string :phone_number
      t.string :hours

      t.timestamps
    end
  end
end
