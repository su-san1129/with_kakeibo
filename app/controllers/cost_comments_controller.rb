class CostCommentsController < ApplicationController
	def create
		variable_cost = VariableCost.find(params[:variable_cost_id])
    comment = current_user.cost_comments.new(cost_comment_params)
    comment.variable_cost_id = variable_cost.id
    comment.save
    redirect_to variable_cost_path(variable_cost)
	end

	def destroy
		
	end

	private
		def cost_comment_params
		params.require(:cost_comment).permit(:user_id, :variable_cost_id, :comment)
		end
end
