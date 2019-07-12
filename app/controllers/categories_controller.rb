class CategoriesController < ApplicationController

	def create
		@category = Category.new(category_params)
		if @category.save
			redirect_to user_path(current_user), notice: "カテゴリーを保存しました。"
		else
			redirect_to user_path(current_user), notice: "カテゴリーが未記入です。保存できませんでした。"
		end
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

