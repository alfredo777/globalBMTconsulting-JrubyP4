class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.string :notable_type
      t.string :notable_id
      t.text :note

      t.timestamps
    end
  end
end
