class CocktailsController < ApplicationController

	def index
		@cocktail = Cocktail.all
	end
	def new
		@new_cocktail = Cocktail.new

	end

	def show
		@cocktail = Cocktail.find(params[:id])
	end


	def create
		@new_cocktail = Cocktail.new(cocktail_params)
    if @new_cocktail.save
      redirect_to cocktail_path(@new_cocktail)
    end
	end

	private

  def cocktail_params
    params.require(:cocktail).permit(:name, :id)
  end

end
