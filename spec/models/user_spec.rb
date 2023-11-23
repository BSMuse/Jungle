require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it 'is valid with valid attributes' do
      user = User.new(
        first_name: 'John',
        last_name: 'Doe',
        email: 'test@test.com',
        password: 'password',
        password_confirmation: 'password'
      )
      expect(user).to be_valid
    end

    it 'is not valid without a password' do
      user = User.new(
        first_name: 'John',
        last_name: 'Doe',
        email: 'test@test.com'
      )
      expect(user).not_to be_valid
    end

    it 'is not valid if password and password_confirmation do not match' do
      user = User.new(
        first_name: 'John',
        last_name: 'Doe',
        email: 'test@test.com',
        password: 'password',
        password_confirmation: 'differentpassword'
      )
      expect(user).not_to be_valid
    end

    it 'is not valid without an email' do
      user = User.new(
        first_name: 'John',
        last_name: 'Doe',
        password: 'password',
        password_confirmation: 'password'
      )
      expect(user).not_to be_valid
    end

    it 'is not valid without a first name' do
      user = User.new(
        last_name: 'Doe',
        email: 'test@test.com',
        password: 'password',
        password_confirmation: 'password'
      )
      expect(user).not_to be_valid
    end

    it 'is not valid without a last name' do
      user = User.new(
        first_name: 'John',
        email: 'test@test.com',
        password: 'password',
        password_confirmation: 'password'
      )
      expect(user).not_to be_valid
    end

    it 'is not valid if the email is not unique (case insensitive)' do
      User.create(
        first_name: 'John',
        last_name: 'Doe',
        email: 'test@test.com',
        password: 'password',
        password_confirmation: 'password'
      )
      user = User.new(
        first_name: 'Jane',
        last_name: 'Doe',
        email: 'TEST@test.com', # Testing case insensitivity
        password: 'differentpassword',
        password_confirmation: 'differentpassword'
      )
      expect(user).not_to be_valid
    end

    # Additional validation tests for uniqueness, etc.
  end

  describe 'Password minimum length' do
    it 'requires the password to have a minimum length of 6 characters' do
      user = User.new(
        first_name: 'John',
        last_name: 'Doe',
        email: 'test@test.com',
        password: 'pass',
        password_confirmation: 'pass'
      )
      expect(user).not_to be_valid
    end
  end

  describe '.authenticate_with_credentials' do
    it 'authenticates with spaces around email' do
      user = User.create(
        first_name: 'John',
        last_name: 'Doe',
        email: 'test@test.com',
        password: 'password',
        password_confirmation: 'password'
      )

      authenticated_user = User.authenticate_with_credentials(' test@test.com ', 'password')
      expect(authenticated_user).to eq(user)
    end

    it 'authenticates with wrong case email' do
      user = User.create(
        first_name: 'John',
        last_name: 'Doe',
        email: 'eXample@domain.COM',
        password: 'password',
        password_confirmation: 'password'
      )

      authenticated_user = User.authenticate_with_credentials('EXAMPLe@DOMAIN.CoM', 'password')
      expect(authenticated_user).to eq(user)
    end
  end
end