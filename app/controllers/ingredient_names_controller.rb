class IngredientNamesController < ApplicationController
  before_action :set_ingredient_name, only: [:show, :edit, :update, :destroy]
  before_action :require_admin


  def index
    @ingredient_names = IngredientName.paginate(page: params[:page], per_page: 5)
  end

  def show
  end

  def new
    @ingredient_name = IngredientName.new
  end

  def edit
  end

  def create
    @ingredient_name = IngredientName.new(ingredient_name_params)
    if @ingredient_name.save
      flash[:notice] = "Ingredient was created successfully."
      redirect_to @ingredient_name
    else
      render 'new'
    end
  end

  def update
    if @ingredient_name.update(ingredient_name_params)
      flash[:notice] = "Ingredient was updated successfully."
      redirect_to @ingredient_name
    else
      render 'edit'
    end
  end

  def destroy
    @ingredient_name.destroy
    redirect_to ingredient_name_path
  end

  private

  def set_ingredient_name
    @ingredient_name = IngredientName.find(params[:id])
  end

  def ingredient_name_params
    params.require(:ingredient_name).permit(:name)
  end

  def require_admin
    if !(logged_in? && current_user.admin?)
      flash[:alert] = "Only admins can perform that action"
      redirect_to ingredient_name_path
    end
  end
end