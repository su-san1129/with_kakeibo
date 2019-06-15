class VariableCost < ApplicationRecord
	belongs_to :user
	belongs_to :category
	has_many :cost_comments, dependent: :destroy
	has_many :favorites, dependent: :destroy
	has_many :maps, dependent: :destroy
	accepts_nested_attributes_for :maps, allow_destroy: true
	attachment :cost_image

	def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

	def start_time
  	self.payment_day
  end

end
