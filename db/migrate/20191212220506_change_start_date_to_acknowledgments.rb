class ChangeStartDateToAcknowledgments < ActiveRecord::Migration[6.0]
  def change
    change_column :acknowledgments, :start_date, :date
  end
end