class VariableCost < ApplicationRecord
	belongs_to :user
	belongs_to :category
	has_many :cost_comments, dependent: :destroy
	has_many :favorites, dependent: :destroy
	geocoded_by :address
	after_validation :geocode, if: :address_changed?
	attachment :cost_image

	def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

	def start_time
  	self.payment_day
  end

end
