require 'rails_helper'

RSpec.describe Product, type: :model do

  describe 'Validations' do

    it 'should be auto-assigned by AR for saved records' do
      @category = Category.new(
        name: 'Drinks'
        )
      @product = Product.new(
        name: 'Water',
        price: 1000,
        quantity: 5,
        category: @category
        )
      # we use bang here b/c we want our spec to fail if save fails (due to validations)
      # we are not testing for successful save so we have to assume it will be successful
      @product.save!

      expect(@product.id).to be_present
    end
    # Note that none of the tests below actually save the product to database because this is
    # a very expensive task to do.
    it 'should have a name' do
      @category = Category.new(name: 'Drinks')
      @product = Product.new(name: 'Water',price: 1000,quantity: 4,category: @category)

      expect(@product).to be_valid
    end

    it 'should have a price' do
      @category = Category.new(name: 'Drinks')
      @product = Product.new(name: 'Water',price: 1000,quantity: 4,category: @category)

      expect(@product).to be_valid
    end

    it 'should have a quantity' do
      @category = Category.new(name: 'Drinks')
      @product = Product.new(name: 'Water',price: 1000,quantity: 5,category: @category)

      expect(@product).to be_valid
    end

    it 'should have an associated category' do
      @category = Category.new(name: 'Drinks')
      @product = Product.new(name: 'Water',price: 1000,quantity: 4,category: @category)

      @product.save!
      expect(@product).to be_valid
    end

  end

end
