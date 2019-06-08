class CreateIncomes < ActiveRecord::Migration[5.2]
  def change
    create_table :incomes do |t|
    	t.datetime :payday
    	t.integer  :income

      t.timestamps
    end
  end
end
