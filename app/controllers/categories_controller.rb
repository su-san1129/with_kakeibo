# frozen_string_literal: true

class CategoriesController < ApplicationController
  
  def show
    @category = Category.find(params[:id])
    @categories = current_user.variable_costs.where(category_id: params[:id])
  end

  def create
    @category = Category.new(category_params)
    @category.save
    redirect_to user_path(current_user)
  end

  def destroy
    category = Category.find(params[:id])
    category.destroy
    redirect_to user_path(current_user)
  end

  private

  def category_params
    params.require(:category).permit(:category, :user_id, :status)
  end
end
