require 'rails_helper'

describe 'static pages' do
  subject { page }

  describe 'home page' do
    before { visit root_path } # i am not sure why this this failing... it tells me that 'visit' is an undefined method when i run rpec..

    it { should have_title('Manly Drinks') }
    it { should have_selector('h1', text: 'Manly!') }
  end

  describe 'about page' do
  	before { visit root_path } # i am not sure why this this failing... it tells me that 'visit' is an undefined method when i run rpec..

  	it { should have_title('About') }
  	it { should have selector('p', text: 'Food') }
  end

end

