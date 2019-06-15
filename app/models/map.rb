class Map < ApplicationRecord
	belongs_to :variable_cost
	geocoded_by :address
	after_validation :geocode, if: :address_changed?
end
