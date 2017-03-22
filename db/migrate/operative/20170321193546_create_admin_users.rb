class CreateAdminUsers < ActiveRecord::Migration
  def change
    create_table :admin_users do |t|
      t.string :name
      t.string :email
      t.string :salt
      t.string :password

      t.timestamps
    end
  end
end
