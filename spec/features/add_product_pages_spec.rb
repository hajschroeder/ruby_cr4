require 'rails_helper'

describe "the add a product process" do
  before(:each) do 
    user = User.create!(:email => 'test@example.com', :password => 'f4k3p455w0rd', :admin => true)
    login_as(user, :scope => :user)
  end
  it "adds a new product" do
    user = User.create!(:email => 'test@example.com', :password => 'f4k3p455w0rd', :admin => true)
    login_as(user, :scope => :user)
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

