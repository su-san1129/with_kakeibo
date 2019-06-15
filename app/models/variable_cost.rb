class VariableCost < ApplicationRecord
	belongs_to :user
	belongs_to :category
	has_many :cost_comments, dependent: :destroy
	attachment :cost_image

	def start_time
  	self.payment_day
  end
end
