class IngredientsController < ApplicationController

  def index
    @ingredients = Ingredient.all
  end
  def show
    @ingredient = Ingredient.find(params[:id])
  end

  def new

  end

  def create
    @ingredient = Ingredient.new(params.require(:ingredient).permit(:name, :amount, :unit))
    @ingredient.save
    redirect_to @ingredient
  end

end