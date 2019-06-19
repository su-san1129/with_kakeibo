class CreateFixedCosts < ActiveRecord::Migration[5.2]
  def change
    create_table :fixed_costs do |t|
    	t.references :user, foreign_key: true
    	t.references :category, foreign_key: true
    	t.string :fixed_cost_name
    	t.integer :fixed_cost_price
    	t.datetime :fixed_cost_time

      t.timestamps
    end
  end
end
