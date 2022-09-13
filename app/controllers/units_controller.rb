class UnitsController < ApplicationController
  before_action :set_unit, only: [:show, :edit, :update, :destroy]
  before_action :require_admin

  def new
    @unit = Unit.new
  end

  def edit
  end

  def update
    if @unit.update(unit_params)
      flash[:notice] = "Unit was created successfully."
      redirect_to @unit
    else
      render 'edit'
    end
  end

  def index
    @units = Unit.paginate(page: params[:page], per_page: 3)
  end

  def show

  end

  def create
    @unit = Unit.create(unit_params)
    if @unit.save
      flash[:notice] = "Unit was successfully created"
      redirect_to @unit
    else
      render 'new'
    end
  end

  private
  def unit_params
    params.require(:unit).permit(:name, :shortcut_name)
  end

  def set_unit
    @unit = Unit.find(params[:id])
  end

  def require_admin
    if !(logged_in? && current_user.admin?)
      flash[:alert] = "Only admins can perform that action"
      redirect_to recipes_path
    end
  end
end