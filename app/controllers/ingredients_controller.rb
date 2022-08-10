class IngredientsController < ApplicationController

  def index
    @ingredients = Ingredient.all
  end
  def show
    @ingredient = Ingredient.find(params[:id])
  end

  def new
    @ingredient = Ingredient.new
  end

  def edit
    @ingredient = Ingredient.find(params[:id])
  end

  def create
    @ingredient = Ingredient.new(params.require(:ingredient).permit(:name, :amount, :unit))
    if @ingredient.save
      flash[:notice] = "Ingredient was created successfully."
    redirect_to @ingredient
    else
      render 'new'
    end
  end

  def update
    @ingredient = Ingredient.find(params[:id])
    if @ingredient.update(params.require(:ingredient).permit(:name, :amount, :unit))
      flash[:notice] = "Ingredient was updated successfully."
      redirect_to @ingredient
    else
      render 'edit'
    end
  end

end