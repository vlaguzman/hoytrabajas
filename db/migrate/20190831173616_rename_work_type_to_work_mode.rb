class RenameWorkTypeToWorkMode < ActiveRecord::Migration[6.0]
  def self.up
    rename_table :work_types, :work_modes
  end

  def self.down
    rename_table :work_modes, :work_types
  end
end
