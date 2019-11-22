class AddEducationalDegreeToOffer < ActiveRecord::Migration[6.0]
  def change
    add_reference :offers, :educational_degree, foreign_key: true
  end
end
