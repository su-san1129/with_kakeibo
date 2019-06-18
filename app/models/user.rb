class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :variable_costs, dependent: :destroy
  has_many :categories, dependent: :destroy
  has_many :incomes, dependent: :destroy
  has_many :cost_comments, dependent: :destroy

  has_many :active_relationships, class_name: "Relationship", foreign_key: :following_id
  has_many :followings, through: :active_relationships, source: :follower
  has_many :passive_relationships, class_name: "Relationship", foreign_key: :follower_id
  has_many :followers, through: :passive_relationships, source: :following

  has_many :favorites, dependent: :destroy
  has_many :fixed_costs, inverse_of: :user
  accepts_nested_attributes_for :fixed_costs, reject_if: :all_blank, allow_destroy: true

  attachment :profile_image

  def followed_by?(user)
    passive_relationships.find_by(following_id: user.id).present?
  end

end
