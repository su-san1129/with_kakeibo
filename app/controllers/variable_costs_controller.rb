class VariableCostsController < ApplicationController
	before_action :authenticate_user!
	before_action :set_variable_cost, only: [:show, :edit, :update, :destroy]
	before_action :correct_user, only: [:edit, :update]

	def index
	end

	def show
		@user = User.find(params[:id])
		@cost_comment = CostComment.new
	end

	def create
		@variable_cost = VariableCost.new(variable_cost_params)

		respond_to do |format|
	    if @variable_cost.save
	      format.html { redirect_to user_path(current_user.id), notice: '入力が完了しました！' }
	      # format.json { render :show, status: :created, location: @variable_cost }
	    else
	      format.html { render "users/index" }
	      # format.json { render json: @variable_cost.errors, status: :unprocessable_entity }
	    end
	  end
  end

	def edit
	end

	def update
	end

	def destroy
		@variable_cost.destroy
		redirect_to user_path(current_user), notice: "post was successfully destroyed"
	end

	private

		def variable_cost_params
		 params.require(:variable_cost).permit(
		 	:user_id,
		 	:category_id,
		 	:price,
		 	:opinion,
		 	:cost_image,
		 	:payment_day,
		 	:title
		 	)
		end

    def set_variable_cost
			@variable_cost = VariableCost.find(params[:id])
		end

	  def correct_user
	    user = User.find(params[:id])
	    if current_user != user
	      redirect_to users_path
	    end
	  end
end
