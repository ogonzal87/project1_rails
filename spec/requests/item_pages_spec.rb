require 'rails_helper'

describe 'item pages' do
  subject { page }

  describe 'index' do
  	Recipe.destroy_all
	
		let(:drink1) { Recipe.create(name: 'Jack and Coke', description: 'This is delicious, trust me', 
								 ingredients: 'blah, blah, blah', time: 'It would take less than 4 minutes', 
								 directions: 'Just add water', image_file: 'image/jpg') }
		let(:drink2) { Recipe.create(name: 'Lemon Drops', description: 'This is delicious, trust me', 
								 ingredients: 'blah, blah, blah', time: 'It would take less than 4 minutes', 
								 directions: 'Just add water', image_file: 'image/jpg') }


	before { visit drinks_path }

   it { should have_selector('h3', text: 'These are the coolest drinks ever') }

   it "lists each drink" do
      Recipe.all.each do |drink|
        expect(page).to have_selector('li', text: drink.id)
      end
    end
  end

  describe 'show' do

	  let(:drink) { Recipe.create(name: 'Jack and Coke', description: 'This is delicious, trust me', 
									 ingredients: 'blah, blah, blah', time: 'It would take less than 4 minutes', 
									 directions: 'Just add water', image_file: 'image/jpg') }

	  before { visit drink_path(drink.id) }

	  it { should have_selector('h2', text: drink.name) }
	
	end

end