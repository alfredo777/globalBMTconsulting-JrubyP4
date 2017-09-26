class AdminAcountsArrayToUserApp < ActiveRecord::Migration
  def change
  	add_column :user_apps, :accounts_array, :text
  	add_column :user_apps, :have_users_extra_accounts, :boolean, default: false
  end
end
