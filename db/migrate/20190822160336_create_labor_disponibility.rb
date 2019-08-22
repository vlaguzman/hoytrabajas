class CreateLaborDisponibility < ActiveRecord::Migration[6.0]
  def change
    create_table :labor_disponibilities do |t|
      t.string :description
    end
  end
end
