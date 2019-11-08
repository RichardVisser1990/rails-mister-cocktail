class CocktailsController < ApplicationController
  def index
    @cocktails = Cocktail.all
  end

  def show
    @cocktail = Cocktail.find(params[:id])
    @dose = Dose.new
  end

  def new
    @cocktail = Cocktail.new
    if @cocktail.save
      redirect_to cocktail_path(@cocktail)
    else
      render 'new'
    end
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)
    @cocktail.save
  end

 private

  def cocktail_params
    params.require(:cocktail).permit(:name)
  end
end
