class AddChangesToComments < ActiveRecord::Migration
  def change
  	add_column :comments, :user_app_id, :integer
  end
end
