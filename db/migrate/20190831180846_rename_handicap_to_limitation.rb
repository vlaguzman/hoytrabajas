class RenameHandicapToLimitation < ActiveRecord::Migration[6.0]
  def self.up
    rename_table :handicaps, :limitations
  end

  def self.down
    rename_table :limitations, :handicaps
  end
end
