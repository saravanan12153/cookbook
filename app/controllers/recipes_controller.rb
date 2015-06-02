class RecipesController < ApplicationController
  before_action :set_recipe, only: [:edit, :update, :show, :like]
  before_action :require_user, except: [:show, :index]
  before_action :confirm_user, only: [:edit, :update]

  def index
    @recipes = Recipe.paginate(page: params[:page], per_page: 4).order(updated_at: :desc)
  end

  def show
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new recipe_params
    @recipe.chef = current_user

    if @recipe.save
      flash[:success] = 'Your recipe was created.'
      redirect_to @recipe
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @recipe.update recipe_params
      flash[:success] = 'Your recipe was updated.'
      redirect_to @recipe
    else
      render :edit
    end
  end

  def like
    like = Like.find_or_create_by(chef: current_user, recipe: @recipe)

    like.update(like: params[:like])
    redirect_to :back
  end

  private

  def recipe_params
    params.require(:recipe).permit :name, :summary, :description, :picture
  end

  def set_recipe
    @recipe = Recipe.find params[:id]
  end

  def confirm_user
    if current_user != @recipe.chef
      flash[:danger] = "You can't edit other users recipes."
      redirect_to root_path
    end
  end

end
