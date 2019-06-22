class Income < ApplicationRecord
	belongs_to :user

	validates :income, presence: true
end
