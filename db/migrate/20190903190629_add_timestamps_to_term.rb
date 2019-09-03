class AddTimestampsToTerm < ActiveRecord::Migration[6.0]
  def self.up
    change_table :terms do |t|
      t.timestamps
    end
  end

  def self.down
    remove_column :terms, :created_at
    remove_column :terms, :updated_at
  end
end
