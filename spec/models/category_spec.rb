require 'rails_helper'

RSpec.describe Category, type: :model do
  before :each do
    @author = User.create(name: 'Tom', email: 'wvw@gmail.com', password: 'dwefwe')
  end

  it 'is valid with valid attributes ' do
    expect(Category.create(user: @author, icon: 'wcwrknvevnenevvk', name: 'category')).to be_valid
  end

  it 'is not valid with icon empty ' do
    expect(Category.create(user: @author, icon: '', name: 'category')).to_not be_valid
  end

  it 'is not valid with icon empty ' do
    expect(Category.create(user: @author, icon: 'wcwrknvevnenevvk', name: '')).to_not be_valid
  end
end
