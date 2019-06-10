class IncomesController < ApplicationController

	def create
		@income = Income.new(income_params)
		if Income.find_by(user_id: current_user.id, payday: Time.now.all_month).present?
			@income = Income.find_by(user_id: current_user.id)
			@income.update(income_params)
		else
			@income.save
			redirect_to user_path
		end
	end
		# if @income.save
		# 	redirect_to user_path(current_user.id)
		# else
		# 	render "users/index"
		# end
		# respond_to do |format|
		#    if @income.save
		#      format.html { redirect_to user_path(current_user.id), notice: '入力が完了しました！' }
		#      # format.json { render :show, status: :created, location: @variable_cost }
		#    else
		#      format.html { render "users/index" }
		#      # format.json { render json: @variable_cost.errors, status: :unprocessable_entity }
		#    end
		#  end

	private
		def income_params
			params.require(:income).permit(:payday, :income, :user_id)
		end

end
