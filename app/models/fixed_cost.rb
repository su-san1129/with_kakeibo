class FixedCost < ApplicationRecord
	belongs_to :user

	validates :fixed_cost_price, presence: true
end
