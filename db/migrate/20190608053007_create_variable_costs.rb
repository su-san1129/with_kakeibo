class CreateVariableCosts < ActiveRecord::Migration[5.2]
  def change
    create_table :variable_costs do |t|
    	t.references :user, foreign_key: true
			t.references :category, foreign_key: true
			t.integer :price
			t.text :opinion
			t.text :cost_image_id
			t.datetime :payment_day
      t.string :address
      t.float :latitude
      t.float :longitude
      t.timestamps
    end
  end
end
