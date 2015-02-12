class DrinksController < ApplicationController
  
  def index 
    @active = 'drinks'
    search_term = params[:search]
    if search_term 	
    	@drinks = Drink.search(search_term)
    else
    	@drinks = Drink.all
    end
  end

  def show 
    @active = 'drinks'
    @drink = Drink.find(params[:id].to_i)
  end

  def new
    @active = 'drinks'
    @drink = Drink.new
  end

  def create
    @drink = Drink.new(drink_params)
    if @drink.save
      flash[:success] = "Drink created."
      redirect_to drinks_path
    else
      render 'new'
    end
  end
  
  def edit
    @active = 'drinks'
    @drink = Drink.find(params[:id])
  end

  def update
    @drink = Drink.find(params[:id])
    if @drink.update_attributes(drink_params)
      flash[:success] = "The drink is updated."
      redirect_to drink_path(@drink.id)
    else
      render 'edit'
    end
  end

  def destroy
    @drink = Drink.find(params[:id])
    @drink.destroy
    flash[:success] = "Drink hs been deleted."
    redirect_to drinks_path
  end

  private

  def drink_params
    params.require(:drink).permit(:name, :description, :ingredients,
                                 :time, :directions, :image_file)
  end
  
end