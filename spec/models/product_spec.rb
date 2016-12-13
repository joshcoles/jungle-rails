require 'rails_helper'

RSpec.describe Product, type: :model do

  describe 'Validations' do

   before :each do
      @category = Category.create
    end

    it 'should have a valid test subject' do
      @product = Product.new(name: 'Funny Hat', price: 20, quantity: 2, category: @category)
      expect(@product).to be_valid
    end

    it 'should be invalid without a name' do
      @product = Product.new(name: nil, price: 20, quantity: 2, category: @category)
      expect(@product).to_not be_valid
      expect(@product.errors[:name]).to include("can't be blank")
    end

    it 'should be invalid without a price' do
      @product = Product.new(name: nil, price: nil, quantity: 2, category: @category)
      expect(@product).to_not be_valid
      expect(@product.errors[:price]).to include("can't be blank")
    end

    it 'should be invalid without a quantity' do
      @product = Product.new(name: nil, price: 20, quantity: nil, category: @category)
      expect(@product).to_not be_valid
      expect(@product.errors[:quantity]).to include("can't be blank")
    end

    it 'should be invalid without a price' do
      @product = Product.new(name: nil, price: nil, quantity: 2, category: nil)
      expect(@product).to_not be_valid
      expect(@product.errors[:category]).to include("can't be blank")
    end



  end
end
