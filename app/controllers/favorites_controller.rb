class FavoritesController < ApplicationController

	before_action :set_variable_cost, only: [:create, :destroy]

	def create
	  favorite = current_user.favorites.new(variable_cost_id: @variable_cost.id)
	  favorite.save
	  redirect_to variable_cost_path(@variable_cost)
	end
	def destroy
	  favorite = current_user.favorites.find_by(variable_cost_id: @variable_cost.id)
	  favorite.destroy
	  redirect_to variable_cost_path(@variable_cost)
	end

	private
		def set_variable_cost
			@variable_cost = VariableCost.find(params[:variable_cost_id])
		end

end
