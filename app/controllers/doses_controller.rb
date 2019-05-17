class DosesController < ApplicationController
  before_action :find_it, only: [:new, :create]

  def new
    find_it
    @dose = Dose.new
  end

  def create
    find_it
    @dose = Dose.new(params_doses)
    @dose.cocktail = @cocktail #this is the extra line you need to associate when N-N
    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  def destroy
    @dose = Dose.find(params[:id])
    @cocktail = @dose.cocktail.id
    @dose.destroy
    redirect_to cocktail_path(@cocktail)
  end


private

  def find_it
    @cocktail = Cocktail.find(params[:cocktail_id])
  end

  def params_doses
    params.require(:dose).permit(:ingredient_id, :description)
  end
end
