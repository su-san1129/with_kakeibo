class CategoriesController < ApplicationController

	def create
		@category = Category.new(category_params)
		@category.save
		redirect_to users_path(current_user)
	end

	private
	def category_params
		params.require(:category).permit(:category, :user_id, :status)
	end
end

