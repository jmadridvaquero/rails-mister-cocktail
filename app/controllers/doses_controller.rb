class DosesController < ApplicationController

	def index
		@dose = Dose.all
	end

	def new
		@new_dose = Dose.new
	end

	def destroy
		@dose = Dose.find(params[:id])
  	@dose.destroy
  	redirect_to doses_path
	end


end
