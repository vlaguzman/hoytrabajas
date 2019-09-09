class AddEducationalDegreeToUser < ActiveRecord::Migration[6.0]
  def change
    add_reference :users, :educational_degree, foreign_key: true
  end
end