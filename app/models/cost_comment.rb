class CostComment < ApplicationRecord
	belongs_to :user
	belongs_to :variable_cost
end
