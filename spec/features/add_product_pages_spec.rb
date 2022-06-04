require 'rails_helper'

describe "the add a product process" do
  it "adds a new product" do
    visit products_path
    click_link 'Add a new Product'
    fill_in 'Name', :with => 'Lasagna'
    fill_in 'Cost', :with => 5
    fill_in 'Country of origin', :with => "Italy"
    click_on 'Create Product'
    expect(page).to have_content 'Product has been added. Thank you for your contribution'
    expect(page).to have_content 'Lasagna'
  end

  it "gives an error when no name is entered" do
    visit new_product_path
    click_on 'Create Product'
    expect(page).to have_content "Name can't be blank"
  end
end

