class CreateAppliedOfferTransition < ActiveRecord::Migration[6.0]
  def change
    create_table :applied_offer_transitions do |t|
        t.string :to_state, null: false
        t.json :metadata, default: {}
        t.integer :sort_key, null: false
        t.integer :curriculum_vitae_id, null: false
        t.boolean :offer_id, null: false
        t.timestamps null: false
      end
  end
end
