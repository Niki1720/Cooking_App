class IngredientsController < ApplicationController
  before_action :set_ingredient, only: [:show, :edit, :update, :destroy]
  before_action :require_user, except: [:show, :index]

  def index
    @ingredients = Ingredient.paginate(page: params[:page], per_page: 5)
  end
  def show
  end

  def new
    @ingredient = Ingredient.new
  end

  def edit
  end

  def create
    @ingredient = Ingredient.new(ingredient_params)
    if @ingredient.save
      flash[:notice] = "Ingredient was created successfully."
    redirect_to @ingredient
    else
      render 'new'
    end
  end

  def update
    if @ingredient.update(ingredient_params)
      flash[:notice] = "Ingredient was updated successfully."
      redirect_to @ingredient
    else
      render 'edit'
    end
  end

  def destroy
    @ingredient.destroy
    redirect_to ingredients_path
  end

  private

  def set_ingredient
    @ingredient = Ingredient.find(params[:id])
  end

  def ingredient_params
    params.require(:ingredient).permit(:name, :amount, unit_ids: [])
  end

end