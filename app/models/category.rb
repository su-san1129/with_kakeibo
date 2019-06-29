class Category < ApplicationRecord
	belongs_to :user
	has_many :variable_costs

	# バリデーション
	validates :category, presence: true
end
