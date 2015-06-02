class ChefsController < ApplicationController
  before_action :set_user, only: [:edit, :update, :show]
  before_action :confirm_user, only: [:edit, :update]

  def new
    @chef = Chef.new
  end

  def create
    @chef = Chef.new chef_params

    if @chef.save
      session[:chef_id] = @chef.id
      flash[:success] = 'Your account has been successfully created.'
      redirect_to @chef
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @chef.update chef_params
      flash[:success] = 'Your profile has been updated successfully.'
      redirect_to @chef
    else
      render :edit
    end
  end

  def index
    @chefs = Chef.paginate(page: params[:page], per_page: 5)
  end

  def show
    @recipes = @chef.recipes.paginate(page: params[:page], per_page: 3).order(updated_at: :desc)
  end

  def destroy
  end

  private

  def chef_params
    params.require(:chef).permit :name, :email, :password
  end

  def set_user
    @chef = Chef.find params[:id]
  end

  def confirm_user
    if current_user != @chef
      flash[:danger] = "You can't edit other users profiles."
      redirect_to root_path
    end
  end
end
