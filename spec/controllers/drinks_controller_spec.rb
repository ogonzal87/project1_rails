require 'rails_helper'

describe DrinksController, type: :controller do 


	let(:drink1) { Drink.create(name: 'Jack and Coke', description: 'This is delicious, trust me', 
								 ingredients: 'blah, blah, blah', 
								 time: 'It would take less than 4 minutes', 
								 directions: 'Just add water', image_file: 'image/jpg') }
	let(:drink2) { Drink.create(name: 'Lemon Drops', description: 'This is delicious, trust me', 
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

	describe 'GET #new' do
    it 'renders new' do
      get :new
      expect(response).to render_template(:new)
    end

    it 'assigns a new Drink' do
      get :new
      expect(assigns(:drink)).to be_a_new(Drink)
    end
  end


	describe 'GET #edit' do
    let(:drink_for_edit) { Drink.create(name: 'Lemon Drops', description: 'This is delicious, trust me', 
								 ingredients: 'blah, blah, blah', time: 'It would take less than 4 minutes', 
								 directions: 'Just add water', image_file: 'image/jpg') }
    # Assume for discussion that item.id == 3
    it 'renders edit' do
      get :edit, id: drink_for_edit.id # /items/3/edit
      expect(response).to render_template(:edit) # loads the edit template
    end

    # Want to confirm @item = Item.find(3) when we go to /items/3/edit
    it 'assigns correct drink' do
      get :edit, id: drink_for_edit.id
      expect(assigns(:drink)).to eq(drink_for_edit) # @item == item_for_edit (defined above)
    end
  end


































	describe 'POST #create' do
	  context 'valid attributes' do
	    let(:valid_attributes) { { name: 'Lemon Drops', description: 'This is delicious, trust me',
	                               ingredients: 'blah, blah, blah', time: 'It would take less than 4 minutes',
	                               directions: 'Just add water', image_file: 'image/jpg' } }

	    it 'create new drink' do
	        expect{
	          post :create, drink: valid_attributes
	        }.to change(Drink, :count).by(1)
	      end
			end
		

			it 'redirects to drinks#index' do
	        post :create, drink: valid_attributes
	        expect(response).to redirect_to(drinks_path)
	    end
	  end

    context 'invalid attributes' do
      let(:invalid_attributes) { { name: '' } }

      it 'does not create new drink' do
        expect{
          post :create, drink: invalid_attributes
        }.to_not change(Drink, :count)
      end

      it 're-renders new' do
        post :create, drink: invalid_attributes
        expect(response).to render_template(:new)
      end
		end


end