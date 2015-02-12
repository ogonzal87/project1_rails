require 'rails_helper'

describe 'item pages' do
  subject { page }

  describe 'index' do
  	Drink.destroy_all
	
		let(:drink1) { Drink.create(name: 'Jack and Coke', description: 'This is delicious, trust me', 
								 ingredients: 'blah, blah, blah', time: 'It would take less than 4 minutes', 
								 directions: 'Just add water', image_file: 'image/jpg') }
		let(:drink2) { Drink.create(name: 'Lemon Drops', description: 'This is delicious, trust me', 
								 ingredients: 'blah, blah, blah', time: 'It would take less than 4 minutes', 
								 directions: 'Just add water', image_file: 'image/jpg') }


	before { visit drinks_path }

   it { should have_selector('h3', text: 'These are the coolest drinks ever') }

   it "lists each drink" do
      Drink.all.each do |drink|
        expect(page).to have_selector('li', text: drink.id)
      end
    end
  end

  describe 'show' do

	  let(:drink) { Drink.create(name: 'Jack and Coke', description: 'This is delicious, trust me', 
									 ingredients: 'blah, blah, blah', time: 'It would take less than 4 minutes', 
									 directions: 'Just add water', image_file: 'blah blah') }

	  before { visit drink_path(drink.id) }

	  it { should have_selector('h2', text: drink.name) }
	
	end

	describe 'new drink page' do
    before { visit new_drink_path }

    it { should have_selector('h1', 'Add Drink') }

    describe 'create drink' do
      let(:submit) { 'Save' }

      context 'valid information' do
        before do
          fill_in 'Name',   			with: '2-person tent'
          fill_in 'Ingredients',  with: 'blah, blah, blah'
          fill_in 'Description',  with: 'This is delicious, trust me'
          fill_in 'Time',  				with: 'It would take less than 4 minutes'
          fill_in 'Directions',  	with: 'Just add water'
          fill_in 'Image file',  	with: 'blah blah'
        end

        it 'creates drink' do
          expect { click_button submit }.to change(Drink, :count).by(1)
        end
      end

      context 'invalid information' do
        it 'does not create drink' do
          expect { click_button submit }.not_to change(Drink, :count)
        end

        describe 'after submission' do
          before { click_button submit }

          it { should have_content('error') }
        end
      end
    end
  end


	describe 'edit drink page' do
    let(:drink_for_edit) { Drink.create(name: 'Jack and Coke', description: 'This is delicious, trust me', 
									 ingredients: 'blah, blah, blah', time: 'It would take less than 4 minutes', 
									 directions: 'Just add water', image_file: 'blah blah') }
    before { visit edit_drink_path(drink_for_edit.id) }


    it { should have_selector('h1', 'Edit Drink') }

    describe 'update drink' do
      let(:submit) { 'Save' }

      context 'valid information' do

        before do
          # edit one of the fields
          fill_in "Name", with: "Peach Drops"
          click_button submit
        end

        describe 'after saving changes' do
          # it has the title from item#show

          # it has the content of the change made
          specify { expect(drink_for_edit.reload.name).to eq('Peach Drops') }
          # ^ is the shorter way to write:
          # it 'has the updated name' do
          #   expect(item_for_edit.reload.name).to eq('3-person lets get weeeeird bag')
          # end
        end

      end

      context 'invalid information' do
        before do
          # remove the info from one of the required fields
          fill_in "Name", with: " "
          click_button submit
        end
        describe 'after submission' do
          # has the same title as item#edit
          # has the word 'error' on the page
          it { should have_content('error') }
        end
      end
    end
  end
end