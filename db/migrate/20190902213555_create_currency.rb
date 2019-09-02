class CreateCurrency < ActiveRecord::Migration[6.0]
  def change
    create_table :currencies do |t|
      t.string :description

      t.timestamps
    end
  end
end
