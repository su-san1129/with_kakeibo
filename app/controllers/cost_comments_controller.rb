class CostCommentsController < ApplicationController

	before_action :set_variable_cost, only: [:create, :destroy]

	def create
    comment = current_user.cost_comments.new(cost_comment_params)
    comment.variable_cost_id = @variable_cost.id
    comment.save
	end

	def destroy
    comment = @variable_cost.cost_comments.find_by(id: params[:id],user_id: current_user.id)
    comment.destroy
	end

	private
		def cost_comment_params
		params.require(:cost_comment).permit(:user_id, :variable_cost_id, :comment)
		end

		def set_variable_cost
			@variable_cost = VariableCost.find(params[:variable_cost_id])
		end
end
