require 'rails_helper'

describe RecipesController, type: :controller do 


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

	    it 'populate an array of drinks' do
	      get :index
	      expect(assigns(:drinks)).to eq([drink1, drink2])
	    end
	  end

	  describe 'GET #show' do
	    
	    it 'renders show' do
	      get :show, id: drink1.id
	      expect(response).to render_template(:show)
	    end

	    it 'assigns correct drink' do
	      get :show, id: drink1.id
	      expect(assigns(:drink)).to eq(drink1)
	    end
  	end



end