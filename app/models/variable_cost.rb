class VariableCost < ApplicationRecord
	belongs_to :user
	belongs_to :category

	def start_time
  	self.payment_day
  end
end
