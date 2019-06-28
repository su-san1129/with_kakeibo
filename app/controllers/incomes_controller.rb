class IncomesController < ApplicationController

	def create
		@income = Income.new(income_params)
		if Income.find_by(user_id: current_user.id, payday: Time.now.all_month).present?
			@income = Income.find_by(user_id: current_user.id)
			@income.update(income_params)
			redirect_to user_path(current_user),notice: "給与を更新しました！"

		else
			if @income.save
				redirect_to user_path(current_user),notice: "給与を登録しました！"
			else
				render 'users/show',notice: "保存できませんでした。"
			end
		end
	end

	private
		def income_params
			params.require(:income).permit(:payday, :income, :user_id)
		end

end
