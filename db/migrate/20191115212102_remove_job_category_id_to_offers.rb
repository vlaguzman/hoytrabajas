class RemoveJobCategoryIdToOffers < ActiveRecord::Migration[6.0]
  def up
    remove_reference :offers, :job_category
  end

  def down
    add_reference :offers, :job_category
  end
end
