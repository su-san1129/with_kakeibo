class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :variable_costs, dependent: :destroy
  has_many :categories, dependent: :destroy
  has_many :incomes, dependent: :destroy
  has_many :cost_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :fixed_costs, inverse_of: :user
  accepts_nested_attributes_for :fixed_costs, reject_if: :all_blank, allow_destroy: true

  attachment :profile_image

end
