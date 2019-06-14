class VariableCost < ApplicationRecord
	belongs_to :user
	belongs_to :category
	attachment :cost_image

	def start_time
  	self.payment_day
  end
end
