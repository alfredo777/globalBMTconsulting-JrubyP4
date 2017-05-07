class AddRatingToNtsubproyectosagenda < ActiveRecord::Migration
  def change
    add_column :NTSubProyectosAgenda, :rating, :integer, default: 3
  end
end
