class RecipesController < ApplicationController

  def index
    @recipes = Recipe.all.sort_by { |recipe| recipe.liked }.reverse
  end

  def show
    @recipe = Recipe.find params[:id]
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new recipe_params
    # TODO: Set the current user as the chef.
    @recipe.chef = Chef.first

    if @recipe.save
      flash[:success] = 'Your recipe was created.'
      redirect_to recipes_path
    else
      render :new
    end
  end

  def edit
    @recipe = Recipe.find params[:id]
  end

  def update
    @recipe = Recipe.find params[:id]

    if @recipe.update recipe_params
      flash[:success] = 'Your recipe was updated.'
      redirect_to recipes_path
    else
      render :edit
    end
  end

  def like
    @recipe = Recipe.find(params[:id])
    like = Like.find_or_create_by(chef: Chef.first, recipe: @recipe)

    like.update(like: params[:like])
    redirect_to :back
  end

  private

  def recipe_params
    params.require(:recipe).permit :name, :summary, :description, :picture
  end

end
