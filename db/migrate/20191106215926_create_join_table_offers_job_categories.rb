class CreateJoinTableOffersJobCategories < ActiveRecord::Migration[6.0]
  def up
    create_join_table :offers, :job_categories, column_options: { null: false, foreign_key: true } do |t|
      t.index %i[offer_id job_category_id], unique: true
    end
    # migrate job_categories to new table
    up_only do
      Offer.all.each do |offer|
        unless offer.job_category_id.nil?
          offer.update(job_categories: [JobCategory.find(offer.job_category_id)])
        end
      end
      # drop job_category_id from offers
      remove_reference :offers, :job_category
    end
  end

  def down
    add_reference :offers, :job_category
  end
end
