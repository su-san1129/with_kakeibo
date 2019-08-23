# frozen_string_literal: true

class CreateIncomes < ActiveRecord::Migration[5.2]
  def change
    create_table :incomes do |t|
      t.references :user, foreign_key: true
      t.datetime :payday
      t.integer  :income

      t.timestamps
    end
  end
end
