# frozen_string_literal: true

class CreateCostComments < ActiveRecord::Migration[5.2]
  def change
    create_table :cost_comments do |t|
      t.references :user, foreign_key: true
      t.references :variable_cost, foreign_key: true
      t.text :comment
      t.timestamps
    end
  end
end
