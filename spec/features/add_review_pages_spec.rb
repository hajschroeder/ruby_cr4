require 'rails_helper'

describe "the add a review process" do 
  before(:each) do 
    user = User.create!(:email => 'test@example.com', :password => 'f4k3p455w0rd', :admin => true)
    login_as(user, :scope => :user)
  end
  
  it "adds a review to a product" do 
    product = Product.create(:name => 'Lobster Tails', :cost => '37', :country_of_origin => 'United States of America')
    visit product_path(product)
    click_link 'Write a review!'
    fill_in 'Author', :with => 'The FlyEater'
    fill_in 'Content body', :with => 'lorem ipsum we gotta get up to at least fifty characters for this to work'
    fill_in 'Rating', :with => 1
    click_on 'Create Review'
    expect(page).to have_content 'Thank you for your review. It means so much'
    expect(page).to have_content 'Lobster Tails'
  end


  it "gives an error when the field is left blank" do
    product = Product.create(:name => 'Lobster Tails', :cost => '37', :country_of_origin => 'United States of America')
    visit new_product_review_path(product)
    click_on 'Create Review'
    expect(page).to have_content "Content body can't be blank"
  end
end

