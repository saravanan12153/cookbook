class ChefsController < ApplicationController
  def new
    @chef = Chef.new
  end

  def create
    @chef = Chef.new chef_params

    if @chef.save
      session[:chef_id] = @chef.id
      flash[:success] = 'Your account has been successfully created.'
      redirect_to recipes_path
    else
      render :new
    end
  end

  def edit
    @chef = Chef.find params[:id]
  end

  def update
    @chef = Chef.find params[:id]

    if @chef.update chef_params
      flash[:success] = 'Your profile has been updated successfully.'
      redirect_to recipes_path # TODO redirect to user profile.
    else
      render :edit
    end
  end

  def index
    @chefs = Chef.paginate(page: params[:page], per_page: 5)
  end

  def show
    @chef = Chef.find params[:id]
    @recipes = @chef.recipes.paginate(page: params[:page], per_page: 3).order(updated_at: :desc)
  end

  def destroy
  end

  private

  def chef_params
    params.require(:chef).permit :name, :email, :password
  end
end
