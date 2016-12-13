require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do


  before :each do
      @test_user = User.create(first_name: 'Josh', last_name: 'Coles', email: 'josh@joshcoles.com', password: 'testpassword', password_confirmation: 'testpassword')

      @test_user2 = User.new(email: 'josh@joshcoles.com')

      @test_user3 = User.new(email: 'JOSH@JOSHCOLES.COM')

    end


    it 'should be valid with both password and password_confirmation fields' do
      @user = User.new(first_name: 'Mr Syntactic', last_name: 'Sugar', email: 'syntactic_sugar@gmail.com', password: 'sugar', password_confirmation: 'sugar' )
      expect(@user).to be_valid
    end

    it 'should be invalid without both password and password_confirmation fields' do
      @user = User.new(first_name: 'Mr Syntactic', last_name: 'Sugar', email: 'syntactic_sugar@gmail.com', password_confirmation: 'sugar' )
      expect(@user).to_not be_valid
    end

    it 'should be invalid if password and password_confirmation do not match' do
      @user = User.new(first_name: 'Mr Syntactic', last_name: 'Sugar', email: 'syntactic_sugar@gmail.com', password: 'salt', password_confirmation: 'sugar' )
      expect(@user).to_not be_valid
    end

    it 'should be valid if password and password_confirmation match' do
      @user = User.new(first_name: 'Mr Syntactic', last_name: 'Sugar', email: 'syntactic_sugar@gmail.com', password: 'sugar', password_confirmation: 'sugar' )
      expect(@user).to be_valid
    end

    it 'should be invalid if password is not at least 4 characters' do
      @user = User.new(first_name: 'Mr Syntactic', last_name: 'Sugar', email: 'syntactic_sugar@gmail.com', password: 'dog', password_confirmation: 'dog' )
      expect(@user).to_not be_valid
    end

    it 'should be invalid if email is not unique' do
      expect(@test_user2).to_not be_valid
    end

    it 'should be invalid if email is not unique, nor case-sensitive' do
      expect(@test_user3).to_not be_valid
    end

    it 'should be invalid if first_name is not present' do
      @user = User.new(last_name: 'Sugar', email: 'syntactic_sugar@gmail.com', password: 'sugar', password_confirmation: 'sugar' )
      expect(@user).to_not be_valid
    end

    it 'should be invalid if last_name is not present' do
      @user = User.new(first_name: 'Mr Syntactic', email: 'syntactic_sugar@gmail.com', password: 'sugar', password_confirmation: 'sugar' )
      expect(@user).to_not be_valid
    end
  end


  describe '.authenticate_with_credentials' do

    before :each do
      @josh_email = 'josh@joshCOLES.com'
      @josh_pw = 'testpassword'
      @test_user = User.create(first_name: 'Josh', last_name: 'Coles', email: @josh_email, password: @josh_pw, password_confirmation: @josh_pw)
      @test_user_better = User.find_by(email: @josh_email.downcase)
    end

    it 'should be valid when an email and password combination are valid' do
      expect(@test_user.email).to eq(@josh_email)
      expect(@test_user.password).to eq(@josh_pw)
      expect(User.authenticate_with_credentials(@josh_email, @josh_pw))
        .to eq(@test_user_better)
    end

    it 'should be NOT valid on invalid password' do
      expect(User.authenticate_with_credentials(@josh_email, 'pretty fly for a PEI'))
        .to be_falsy
    end

    it 'should be NOT valid on invalid email' do
      expect(User.authenticate_with_credentials('hey_dawg@dogs.com', @josh_pw))
        .to be_falsy
    end

    it 'should allow users to sign in even if they include whitespace on either side of their email address' do
      expect(@test_user.email).to eq(@josh_email)
      expect(@test_user.password).to eq(@josh_pw)
      expect(User.authenticate_with_credentials('      josh@joshcoles.com', @josh_pw))
        .to eq(@test_user_better)
    end

    it 'should allow users to sign in even if they capitalize certain characters in their email address' do
      expect(@test_user.email).to eq(@josh_email)
      expect(@test_user.password).to eq(@josh_pw)
      expect(User.authenticate_with_credentials('josh@JOshColes.com', @josh_pw))
        .to eq(@test_user_better)
    end

  end
end
