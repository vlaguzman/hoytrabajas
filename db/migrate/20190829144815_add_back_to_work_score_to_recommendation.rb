class AddBackToWorkScoreToRecommendation < ActiveRecord::Migration[6.0]
  def change
    add_column :recommendations, :back_to_work_score, :integer
  end
end
