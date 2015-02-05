class DrinksController < ApplicationController
  
  def index 
    @active = 'recipes'
    search_term = params[:search]
    if search_term 	
    	@drinks = Recipes.search(search_term)
    else
    	@drinks = Recipes.all
    end
  end

  def show 
    @active = 'recipes'
    @drink = Recipes.find(params[:id].to_i)
  end
end