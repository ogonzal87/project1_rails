class DrinksController < ApplicationController
  
  def index 
    @active = 'recipes' 
    @drinks = Recipes.all
  end

  def show 
    @active = 'recipes'
    @drink = Recipes.find(params[:id].to_i)
  end
end