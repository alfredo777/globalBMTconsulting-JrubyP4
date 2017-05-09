class CreateDevices < ActiveRecord::Migration
  def change
    create_table :devices do |t|
      t.integer :user_app_id
      t.string :device
      t.string :system
      t.string :serialx

      t.timestamps
    end
  end
end
