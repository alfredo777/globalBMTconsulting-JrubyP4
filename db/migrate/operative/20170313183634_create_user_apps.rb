class CreateUserApps < ActiveRecord::Migration
  def change
    create_table :user_apps do |t|
      t.string :first_name
      t.string :last_name
      t.string :linkedin
      t.string :barcode_presentation_card
      t.string :presentation_card_front
      t.string :presentation_card_behind
      t.string :password
      t.string :salt

      t.timestamps
    end
  end
end
