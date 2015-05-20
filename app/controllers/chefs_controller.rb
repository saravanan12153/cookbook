class ChefsController < ApplicationController
  def new
    @chef = Chef.new
  end

  def create
    @chef = Chef.new chef_params

    if @chef.save
      flash[:success] = 'Your account has been successfully created.'
      redirect_to recipes_path
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def index
  end

  def show
  end

  def destroy
  end

  private

  def chef_params
    params.require(:chef).permit :name, :email, :password
  end
end
