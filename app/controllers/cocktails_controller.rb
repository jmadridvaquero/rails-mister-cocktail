class CocktailsController < ApplicationController

	def index
		@cocktails = Cocktail.all
	end

	def new
		@cocktail = Cocktail.new
	end

	def show
		@cocktail = Cocktail.find(params[:id])
	end


	def create
    @cocktail = Cocktail.new(cocktail_params)
    if @cocktail.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
	end

	def edit
    @cocktail = Cocktail.find(cocktail_params)
  end

  def update
    if @cocktail.update(cocktail_params)
      redirect_to cocktail_path(@cocktail)
    else
      render :edit
    end
  end

  def destroy
    @cocktail = Cocktail.find(params[:id])
    if @cocktail.destroy
      redirect_to cocktails_path
    else
      render :index
    end
  end

	private

  def cocktail_params
    params.require(:cocktail).permit(:name, :id )
  end

end
