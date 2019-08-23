# frozen_string_literal: true

class CategoriesController < ApplicationController
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
