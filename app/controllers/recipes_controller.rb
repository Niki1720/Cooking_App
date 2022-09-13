class RecipesController < ApplicationController
  before_action :set_recipe, only: [:show, :edit, :update, :destroy]
  before_action :require_user, except: [:show, :index]
  before_action :require_same_user, only: [:edit, :update, :destroy]

  def index
    @recipes = Recipe.paginate(page: params[:page], per_page: 5)
  end
  def show
  end

  def new
    @recipe = Recipe.new
    @ingredients = Ingredient.all
    @units = Unit.all
    @ingredient_names = IngredientName.all
  end

  def edit
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.user = current_user
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
    params.require(:recipe).permit(:name, :description, ingredients_attributes: [:name, :amount, :unit_id, :_destroy])
  end

  def require_same_user
    if current_user != @recipe.user && !current_user.admin?
      flash[:alert] = "You can only edit or delete your own recipe"
      redirect_to @recipe
    end
  end

end