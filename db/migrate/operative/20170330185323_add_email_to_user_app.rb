class AddEmailToUserApp < ActiveRecord::Migration
  def change
    add_column :user_apps, :email, :string
  end
end
