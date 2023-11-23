require 'rails_helper'
RSpec.describe Product, type: :model do
  describe 'Validations' do
    it 'is not valid without a name' do
      product = Product.new(price: 10.99, quantity: 5)
      expect(product).not_to be_valid
    end

    it 'is not valid without a price' do
      product = Product.new(name: 'Example Product', quantity: 5)
      expect(product).not_to be_valid
    end

    it 'is not valid without a quantity' do
      product = Product.new(name: 'Example Product', price: 10.99)
      expect(product).not_to be_valid
    end

    it 'is not valid if the price is not a number' do
      product = Product.new(name: 'Example Product', price: 'invalid', quantity: 5)
      expect(product).not_to be_valid
    end
  end
end