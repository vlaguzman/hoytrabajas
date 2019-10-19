class AddSlugNameToOffers < ActiveRecord::Migration[6.0]
  def change
    add_column :offers, :slug, :string
  end
end
