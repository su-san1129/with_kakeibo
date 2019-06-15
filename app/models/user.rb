class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :variable_costs, dependent: :destroy
  has_many :categories, dependent: :destroy
  has_many :fixed_costs, dependent: :destroy
  has_many :incomes, dependent: :destroy
  has_many :cost_comments, dependent: :destroy

  attachment :profile_image

end
