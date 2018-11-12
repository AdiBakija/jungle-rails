require 'rails_helper'

RSpec.describe User, type: :model do

  subject {
    described_class.new(
    name: 'Adi',
    lastname: 'Bakija',
    email: 'adiBAkija @hotmail.com',
    password: 'bananas123',
    password_confirmation: 'bananas123'
    )
  }

  describe 'Validations' do

    it 'should have a first name' do
      expect(subject).to be_valid
    end

    it 'should have a last name' do
      expect(subject).to be_valid
    end

    it 'should have an email' do
      expect(subject).to be_valid
    end

    it 'should have a password' do
      expect(subject).to be_valid
    end

    it 'should have a password confirmation' do
      expect(subject).to be_valid
    end

    it 'should have matching password and confirmation' do
      expect(subject.password).to eql(subject.password_confirmation)
    end

    it 'should not save if an email is already registered under the same name' do
      @user2 = User.new(name: 'John', lastname: 'Smith', email: 'johnbakija@hotmail.com', password: 'bananas123', password_confirmation: 'bananas123')
      @user2.save
      expect(subject).to be_valid
    end

  end

  describe '.authenticate_with_credentials' do

    it 'should return a user if provided email and password match existing user' do
      subject.save
      user = User.authenticate_with_credentials(subject.email, subject.password)
      expect(user).to eql(subject)
    end

  end

  describe '.email_validation' do

    it 'should remove spaces and downcase all emails prior to saving to database' do
      user1 = User.create(name: 'John', lastname: 'Smith', email: 'johnbakija@hotmail.com', password: 'bananas123', password_confirmation: 'bananas123')
      user2 = User.create(name: 'John', lastname: 'Smith', email: 'joHN bakija@hotmail.com', password: 'bananas123', password_confirmation: 'bananas123')
      expect(user2).to be_valid
    end

  end

end
