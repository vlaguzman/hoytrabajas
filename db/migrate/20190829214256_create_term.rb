class CreateTerm < ActiveRecord::Migration[6.0]
  def change
    create_table :terms do |t|
      t.string :description
    end
  end
end