class Category < ApplicationRecord
	belongs_to :user
	has_many :fixed_costs
	has_many :variable_costs
end
