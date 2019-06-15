class MapsController < ApplicationController

	before_action :set_map, only: [:show, :edit, :update, :destroy]
	before_action :set_variable_cost, only: [:index, :new, :edit, :create, :destroy]

	def index
		@maps = @variable_cost.maps.all
	end

	def show
	end

	def new
		@map = Map.new
	end

	def edit
	end

	def create
		@map = @variable_cost.maps.new(map_params)
		respond_to do |format|
			if @map.save
				format.html { redirect_to variable_cost_map_path(variable_cost_id: @map.variable_cost_id, id: @map.id),notice: "マップが作成されました。" }
				format.json { render :show, status: :created, location: variable_cost_map_path(variable_cost_id: @map.variable_cost_id, id: @map.id) }
			else
				format.html { render :new}
				format.json { render json: @map.errors, status: :unprocessable_entity }
			end
		end
	end

	def update
		respond_to do |format|
			if @map.update(map_params)
				format.html { redirect_to variable_cost_map_path(variable_cost_id: @map.variable_cost_id,id: @map.id), notice: "マップが更新されました。" }
				format.json { render :show, status: :ok, location: variable_cost_map_path(variable_cost_id: @map.variable_cost_id, id: @map.id) }
			else
				format.html { render :edit }
				format.json { render json: @map.errors, status: :unprocessable_entity }
			end
		end
	end

	def destroy
		@map.destroy
		respond_to do |format|
			format.html { redirect_to variable_cost_maps_path(variable_cost_id: @variable_cost.id), notice: "マップが削除されました。" }
			format.json { head :no_content }
		end
	end

	private
		def set_map
			@map = Map.find(params[:id])
		end

		def set_variable_cost
			@variable_cost = VariableCost.find_by(id: params[:variable_cost_id])
		end

		def map_params
			params.require(:map).permit(:address, :latitude, :longitude, :variable_cost_id)
		end
end
