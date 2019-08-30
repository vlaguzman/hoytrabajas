class CreateOffer < ActiveRecord::Migration[6.0]
  def change
    create_table :offers do |t|
      t.string    :title
      t.string    :address
      t.string    :cellphone
      t.string    :description
      t.integer   :vacancies_quantity
      t.string    :close_date
      t.boolean   :immediate_start
      t.boolean   :required_experience
      t.string    :description_responsibilities
      t.datetime  :release_date
      t.integer    :status

      t.references :user, null: false, foreign_key: true
      t.references :city, null: false, foreign_key: true
      t.references :job_category, null: false, foreign_key: true
      t.references :offer_type, null: false, foreign_key: true
      t.references :gender, null: false, foreign_key: true
      t.references :work_type, null: false, foreign_key: true
      t.references :contract_type, null: false, foreign_key: true

      t.timestamps
    end
  end
end
