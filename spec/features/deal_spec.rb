require 'rails_helper'

RSpec.describe 'Deal', type: :feature do
  describe 'Deal' do
    before :each do
      @tom = User.create(name: 'Tom', email: 'wvw@gmail.com', password: 'dwefwe')
      visit user_session_path
      fill_in 'user[email]', with: 'wvw@gmail.com'
      fill_in 'user[password]', with: 'dwefwe'
      click_button 'Log in'
      @category = Category.create(user: @tom, icon: 'wcwrknvevnenevvk', name: 'category')
      @deal = Deal.create(user: @author, category: @category, name: 'my_deal', amount: 24)
      @deal.save
    end

    feature 'Deal index page' do
      background { visit category_deals_path(@category.id) }
      it 'I can see the navbar title' do
        expect(page).to have_content('Deals')
      end

      it 'I can see the total amount' do
        expect(page).to have_content('Total amount :')
      end

      it 'I can see the button to create new deal' do
        expect(page).to have_content('New deal')
      end

      it 'I can see the button to Log out' do
        expect(page).to have_content('Log out')
      end

      it 'I can be redirect to categories when click on < ' do
        click_link '<'
        expect(current_path).to eq categories_path
      end
    end
  end
end
