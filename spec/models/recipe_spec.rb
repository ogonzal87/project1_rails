require 'rails_helper'

describe Recipe do 
	let(:recipe) { Recipe.new(name: 'Skinny Girl', description: 'Blah, blah, blah', 
								 ingredients: '2 1/2 ounces cucumber-infused gin, 1/2 ounce lime-flavored simple syrup, Lime wedge', 
					       time: '5 minutes', image_file: 'gimlet.jpg',
					       directions: 'Combine the gin and lime syrup in an ice-filled cocktail.') }

	subject { recipe }

	it { should respond_to(:name) }
	it { should respond_to(:description) }
	it { should respond_to(:ingredients) }
	it { should respond_to(:time) }
	it { should respond_to(:directions) }
	it { should respond_to(:image_file) }

	it { should be_valid }

	describe 'validations' do
    

    describe 'name' do
      
      context 'not present' do
        before { recipe.name = nil }
        it { should_not be_valid }
      end

   		context 'too short' do
        before { recipe.name = 'a' * 2 }
        it { should_not be_valid }
      end

      context 'too long' do
        before { recipe.name = 'a' * 255 }
        it { should_not be_valid }
      end

    end

   	describe 'description' do

   		context 'not present' do
        before { recipe.description = nil }
        it { should_not be_valid }
      end
    end

    describe 'ingredients' do

   		context 'not present' do
        before { recipe.ingredients = nil }
        it { should_not be_valid }
      end
    end

    describe 'time' do

   		context 'not present' do
        before { recipe.time = nil }
        it { should_not be_valid }
      end
    end

    describe 'directions' do

   		context 'not present' do
        before { recipe.directions = nil }
        it { should_not be_valid }
      end
    end

    describe 'image_file' do

   		context 'not present' do
        before { recipe.image_file = nil }
        it { should_not be_valid }
      end
    end
  end
end