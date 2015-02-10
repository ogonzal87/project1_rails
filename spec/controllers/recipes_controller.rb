require 'rails_helper'

describe RecipesController, type: :controller do 

	Recipes.destroy_all

	let(:drink1) { Recipe.create(name: 'Jack and Coke', description: 'This is delicious, trust me', 
															 ingredients: 'blah, blah, blah', 
															 time: 'It would take less than 4 minutes', 
															 directions: 'Just add water', image_file: 'image/jpg') }
	let(:drink2) { Recipe.create(name: 'Lemon Drops', description: 'This is delicious, trust me', 
															 ingredients: 'blah, blah, blah', time: 'It would take less than 4 minutes', 
															 directions: 'Just add water', image_file: 'image/jpg') }


		describe 'GET #index' do
	    
	    it 'renders index' do
	      get :index
	      expect(response).to render_template(:index)
	    end

	    it 'populate an array of items' do
	      get :index
	      # What this is doing:
	      # expect @items == [item1, item2]
	      expect(assigns(:drinks)).to eq([drink1, drink2])
	    end
	  end

	


end