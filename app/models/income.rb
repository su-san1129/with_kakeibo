# frozen_string_literal: true

class Income < ApplicationRecord
  belongs_to :user

  validates :income, presence: true
end
