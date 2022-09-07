require 'rails_helper'

RSpec.describe 'User', type: :feature do
  describe 'User' do
    feature 'Category index page' do
      background { visit root_path }

      it 'I can see the Login Page' do
        expect(page).to have_content('sign in')
      end

      it 'I can see the Sign up Page' do
        expect(page).to have_content('sign up')
      end
    end
  end
end
