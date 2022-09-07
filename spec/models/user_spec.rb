require 'rails_helper'

RSpec.describe User, type: :model do
  it 'is valid with valid attributes ' do
    expect(User.create(name: 'Tom', email: 'wvw@gmail.com', password: 'dwefwe')).to be_valid
  end

  it 'is not valid with name empty ' do
    expect(User.create(name: '', email: 'wvw@gmail.com', password: 'dwefwe')).to_not be_valid
  end

  it 'is not valid with email empty ' do
    expect(User.create(name: 'John', email: '', password: 'dwefwe')).to_not be_valid
  end

  it 'is not valid with password empty ' do
    expect(User.create(name: 'John', email: 'wvw@gmail.com', password: '')).to_not be_valid
  end
end
