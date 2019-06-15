class CostCommentsController < ApplicationController

	before_action :set_variable_cost, only: [:create, :destroy]

	def create
    comment = current_user.cost_comments.new(cost_comment_params)
    comment.variable_cost_id = @variable_cost.id
    comment.save
    redirect_to variable_cost_path(@variable_cost)
	end

	def destroy
    comment = current_user.cost_comments.find_by(variable_cost_id: @variable_cost.id)
    comment.destroy
    redirect_to variable_cost_path(@variable_cost)
	end

	private
		def cost_comment_params
		params.require(:cost_comment).permit(:user_id, :variable_cost_id, :comment)
		end

		def set_variable_cost
			@variable_cost = VariableCost.find(params[:variable_cost_id])
		end
end
