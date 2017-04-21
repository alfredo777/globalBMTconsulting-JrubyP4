class AddAvatarToUserApp < ActiveRecord::Migration
  def change
    add_column :user_apps, :avatar, :string
    add_column :user_apps, :bussines_avatar, :string
  end
end
