class IncomesController < ApplicationController

	def create
		@income = Income.new(income_params)
		if Income.find_by(user_id: current_user.id, payday: Time.now.all_month).present?
			@income = Income.find_by(user_id: current_user.id)
			@income.update(income_params)
			redirect_to user_path(current_user)
		else
			@income.save
			redirect_to user_path(current_user)
		end
	end

	private
		def income_params
			params.require(:income).permit(:payday, :income, :user_id)
		end

end
