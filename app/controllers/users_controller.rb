class UsersController < ApplicationController
	before_action :authenticate_user!
	before_action :set_user, only: [:show, :edit, :update, :destroy]
	before_action :correct_user, only: [:edit, :update]


	def index
		@users = User.all
	end

	def show
		@variable_cost = VariableCost.new
		@income = Income.new
		@variable_costs = @user.variable_costs
		@income_price = Income.find_by(user_id: current_user.id, payday: Time.now.all_month)

	end

	def edit
	end

	def update
		@user.update(user_params)
		redirect_to user_path(current_user)
	end

	def destroy
	end


 private
    def user_params
  	 params.require(:user).permit(:name, :introduction, :profile_image)
    end

    def set_user
			@user = User.find(params[:id])
		end

	  def correct_user
	    user = User.find(params[:id])
	    if current_user != user
	      redirect_to users_path
	    end
	  end
end
