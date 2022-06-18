require 'rails_helper'

describe "the delete a review process" do 
  before(:each) do 
    user = User.create!(:email => 'test@example.com', :password => 'f4k3p455w0rd', :admin => true)
    login_as(user, :scope => :user)
  end
  
  it "deletes a review" do
    product = Product.create(:name => 'Lobster Tails', :cost => '37', :country_of_origin => 'United States of America')
    review = Review.create(:author => 'The FlyEater', :content_body => 'lorem ipsum we gotta get up to at least fifty characters for this to work', :rating => 2, :product_id => product.id)
    visit product_review_path(product, review)
    click_link 'Delete'
    expect(page).to have_content 'Discretion is the better part of valor. I appreciate yours'
    
  end

end
