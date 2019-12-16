class AddCityToAcknowledgments < ActiveRecord::Migration[6.0]
  def change
    add_reference :acknowledgments, :city, foreign_key: true
  end
end
