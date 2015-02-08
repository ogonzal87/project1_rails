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
    @drink = Recipe.find(params[:id].to_i)
  end
end