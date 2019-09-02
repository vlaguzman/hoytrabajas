class CreateOffersSalaries < ActiveRecord::Migration[6.0]
  def change
    create_table :offers_salaries do |t|
      t.references :offer, null: false, foreign_key: true
      t.references :currency, null: false, foreign_key: true
      t.references :salary_type, null: false, foreign_key: true
      t.references :salary_period, null: false, foreign_key: true
      t.integer :from
      t.integer :to
    end
  end
end
