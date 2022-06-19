require 'rails_helper'

describe "the edit a product process" do
  before(:each) do 
    user = User.create!(:email => 'test@example.com', :password => 'f4k3p455w0rd', :admin => true)
    login_as(user, :scope => :user)
  end
  it "edits a product" do
    product = Product.create(:name => 'Lobster Tails', :cost => '37', :country_of_origin => 'United States of America')
    visit product_path(product)
    click_link 'Edit'
    fill_in 'Name', :with => 'Lawbstuh Tails'
    click_on 'Update Product'
    expect(page).to have_content 'You have successfully updated this product. We are so proud of you'
  end

  it "provides an error if the editor tries to leave a field blank" do 
    product = Product.create(:name => 'Lobster Tails', :cost => '37', :country_of_origin => 'United States of America')
    visit edit_product_path(product)
    fill_in 'Name', :with => ''
    click_on 'Update Product'
    expect(page).to have_content "Name can't be blank"
  end
end