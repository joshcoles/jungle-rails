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


  def wait_until
    require "timeout"
    timeout
  end

  scenario "They navigate from home page to specific product page on click" do
  visit root_path
  first('.product').click_link('Details »')
  puts page.html
  end
end




