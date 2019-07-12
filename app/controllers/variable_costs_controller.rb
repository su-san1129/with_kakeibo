class VariableCostsController < ApplicationController
	before_action :authenticate_user!
	before_action :set_variable_cost, only: [:show, :edit, :update, :destroy]
	before_action :correct_user, only: [:edit, :update]

	def index
	end

	def show
		@user = @variable_cost.user
		@cost_comment = CostComment.new
	end

	def create
		@variable_cost = VariableCost.new(variable_cost_params)
    if @variable_cost.save
    	redirect_to user_path(current_user.id), notice: '入力が完了しました！'
    else
    	@user = current_user
    	@variable_costs = @user.variable_costs.order(created_at: :desc)
    	@income = Income.new
    	@fixed_costs = @user.fixed_costs
    	@categories = @user.variable_costs.joins(:category).group("categories.category").count
    	@category = Category.new
		    render 'users/show', notice: "保存に失敗しました。"
    end
  end

	def edit
	end

	def update
		@variable_cost.update(variable_cost_params)
		redirect_to variable_cost_path(@variable_cost)
	end

	def destroy
		@variable_cost.destroy
		redirect_to user_path(current_user), notice: "投稿を削除しました。"
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
		 	:address,
		 	:latitude,
		 	:longitude
		 	)
		end

    def set_variable_cost
			@variable_cost = VariableCost.find(params[:id])
		end

	  def correct_user
	    user = @variable_cost.user
	    if current_user != user
	      redirect_to user_path(user)
	    end
	  end
end
