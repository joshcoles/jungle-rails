require 'rails_helper'

RSpec.feature "ProductDetails", type: :feature, js: true do
  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )

    end
  end

  scenario "A user adds an item to their cart and it updates the cart counter in the header" do
  visit '/'
  first('.product').click_on 'Add'
  within "#navbar" do
    expect(page).to have_link('My Cart (1)')
  end
    expect(page.current_path).to eq('/')
  end
end
