class RemoveSexToOffer < ActiveRecord::Migration[6.0]
  def change
    remove_reference :offers, :sex
  end
end
