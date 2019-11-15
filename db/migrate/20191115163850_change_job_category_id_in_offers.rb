class ChangeJobCategoryIdInOffers < ActiveRecord::Migration[6.0]
  def change
    change_column_null :offers, :job_category_id, true
  end
end
