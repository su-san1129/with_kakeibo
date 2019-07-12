class FixedCost < ApplicationRecord
	belongs_to :user

	validates :fixed_cost_price, presence: true
	validates :fixed_cost_name, presence: true
	validates :user_id, presence: true
end
