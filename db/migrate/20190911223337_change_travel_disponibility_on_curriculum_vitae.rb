class ChangeTravelDisponibilityOnCurriculumVitae < ActiveRecord::Migration[6.0]
  def change
    change_column :curriculum_vitaes, :travel_disponibility, :boolean, using: 'travel_disponibility::boolean'
  end
end
