class FavoritesController < ApplicationController

	before_action :set_variable_cost, only: [:create, :destroy]

	def create
	  favorite = current_user.favorites.new(variable_cost_id: @variable_cost.id)
	  favorite.save
	  # respond_to do |format|
	  # 	if favorite.save
	  # 		format.json { render variable_cost_path(@variable_cost) }
	  # 	else
	  # 		format.json { render favorite.errors, status: :unprocessable_entity }
	  # 	end
	  # end
	end
	def destroy
	  favorite = current_user.favorites.find_by(variable_cost_id: @variable_cost.id)
	  favorite.destroy
	  # respond_to do |format|
	  # 	if favorite.destroy
	  # 		format.json { render variable_cost_path(@variable_cost) }
	  # 	else
	  # 		format.json { render favorite.errors, status: :unprocessable_entity }
	  # 	end
	  # end
	end

	private
		def set_variable_cost
			@variable_cost = VariableCost.find(params[:variable_cost_id])
		end

end
