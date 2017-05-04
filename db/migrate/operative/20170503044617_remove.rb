class Remove < ActiveRecord::Migration
  def change
  	remove_column :comments, :commentable_type
  	remove_column :comments, :commentable_id
  	add_column :comments, :attachment, :string
  	add_column :comments, :ntsub_proyectos_agenda_id, :integer

  end
end
