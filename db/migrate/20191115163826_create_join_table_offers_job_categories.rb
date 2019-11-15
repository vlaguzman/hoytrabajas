class CreateJoinTableOffersJobCategories < ActiveRecord::Migration[6.0]
  def change
    create_join_table :offers, :job_categories, column_options: { null: false, foreign_key: true } do |t|
      t.index %i[offer_id job_category_id], unique: true
    end
  end
end
