class CreateMaps < ActiveRecord::Migration[5.2]
  def change
    create_table :maps do |t|
    	t.references :variable_cost, foreign_key: true
    	t.string :address
    	t.float :latitude
    	t.float :longitude

      t.timestamps
    end
  end
end
