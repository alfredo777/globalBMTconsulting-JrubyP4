class AddRatingToNtsubproyectosagenda < ActiveRecord::Migration
  def change
    add_column :NTSubProyectosAgenda, :rating, :string, default: "3"
  end
end
