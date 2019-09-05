# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: %i[show edit update destroy follows followers]
  before_action :correct_user, only: %i[edit update]

  def index
    @users = User.page(params[:page]).reverse_order.per(6)
  end

  def show
    @variable_cost = VariableCost.new
    @variable_costs = @user.variable_costs.order(created_at: :desc)
    @income = Income.new
    @income_price = Income.find_by(user_id: current_user.id, payday: Time.now.all_month)
    @fixed_costs = @user.fixed_costs
    @category = Category.new
    @categories = @user.variable_costs
                   .joins(:category)
                   .select("variable_costs.id, 
                            category_id,
                            count(categories.category) as category_count,
                            categories.category as category_name")
                   .group(:category_id)
    @chart_data = @user.variable_costs.joins(:category).group('categories.category').sum(:price)
  end

  def edit
    @categories = @user.categories
  end

  def update
    @user.update(user_params)
    redirect_to user_path(current_user)
  end

  def destroy; end

  def follows
    @users = @user.followings.page(params[:page]).reverse_order.per(6)
  end

  def followers
    @users = @user.followers.page(params[:page]).reverse_order.per(6)
  end

  private

  def user_params
    params.require(:user).permit(
      :name,
      :introduction,
      :profile_image,
      fixed_costs_attributes: %i[
        id
        fixed_cost_price
        fixed_cost_time
        fixed_cost_name
        _destroy
      ]
    )
  end

  def set_user
    @user = User.find(params[:id])
     end

  def correct_user
    user = User.find(params[:id])
    redirect_to users_path if current_user != user
    end
end
