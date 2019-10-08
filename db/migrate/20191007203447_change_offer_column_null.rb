class ChangeOfferColumnNull < ActiveRecord::Migration[6.0]
  def change
    change_column_null :offers, :city_id, true
    change_column_null :offers, :offer_type_id, true
    change_column_null :offers, :sex_id, true
    change_column_null :offers, :work_mode_id, true
    change_column_null :offers, :contract_type_id, true
  end
end
