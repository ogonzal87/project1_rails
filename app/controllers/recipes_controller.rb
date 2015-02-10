class RecipesController < ApplicationController
  
  def index 
    @active = 'recipes'
    search_term = params[:search]
    if search_term 	
    	@drinks = Recipe.search(search_term)
    else
    	@drinks = Recipe.all
    end
  end

  def show 
    @active = 'recipes'
    @drink = Recipe.find(params[:id])
  end

  def new
    @active = 'recipes'
    @drink  = Recipe.new
  end

  def create
    @drink = Recipe.new(drink_params)
    if @drink.save
      flash[:success] = "Drink created."
      redirect_to drinks_path
    else
      render 'new'
    end
  end

  private

  def drink_params
    params.require(:drink).permit(:name, :description, :ingredients,
                                 :time, :directions, :image_file)
  end

end