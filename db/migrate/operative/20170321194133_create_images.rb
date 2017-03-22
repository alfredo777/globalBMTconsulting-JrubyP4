class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string :imageable_type
      t.integer :imageable_id
      t.integer :user_app
      t.string :file

      t.timestamps
    end
  end
end
