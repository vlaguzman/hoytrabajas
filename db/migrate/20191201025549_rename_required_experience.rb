class RenameRequiredExperience < ActiveRecord::Migration[6.0]
  def up
    rename_table :required_experiences, :offer_required_experiences
  end

  def down
    rename_table :offer_required_experiences, :required_experiences
  end
end
