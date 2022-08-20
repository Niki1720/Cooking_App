class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
  end
  def show
  end

  def new
    @recipe = Recipe.new
  end

  def edit
  end

  def create
    @recipe = Recipe.new(recipe_params)
    if @recipe.save
      flash[:notice] = "Recipe was created successfully."
      redirect_to @recipe
    else
      render 'new'
    end
  end

  def update
    if @recipe.update(recipe_params)
      flash[:notice] = "Recipe was updated successfully."
      redirect_to @recipe
    else
      render 'edit'
    end
  end

  def destroy
    @recipe.destroy
    redirect_to recipes_path
  end

  private

  def set_recipe
    @recipe = Recipe.find(params[:id])
  end

  def recipe_params
    params.require(:recipe).permit(:name, :description)
  end

end