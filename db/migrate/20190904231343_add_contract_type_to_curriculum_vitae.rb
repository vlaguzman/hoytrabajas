class AddContractTypeToCurriculumVitae < ActiveRecord::Migration[6.0]
  def change
    add_reference :curriculum_vitaes, :contract_type, null: false, foreign_key: true
  end
end
