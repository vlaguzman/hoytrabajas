class ChangeOffersSalariesToOfferSalaries < ActiveRecord::Migration[6.0]
  def change
    rename_table :offers_salaries, :offer_salaries
  end
end
