# frozen_string_literal: true

class CostComment < ApplicationRecord
  belongs_to :user
  belongs_to :variable_cost
end
