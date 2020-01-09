class AddCreateByAdminAdminToTechnicalSkills < ActiveRecord::Migration[6.0]
  def change
    add_column :technical_skills, :create_by_admin, :boolean, default: false
  end
end
