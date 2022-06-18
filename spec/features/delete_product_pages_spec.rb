require 'rails_helper'

describe "the delete a product process" do 
  before(:each) do 
    user = User.create!(:email => 'test@example.com', :password => 'f4k3p455w0rd', :admin => true)
    login_as(user, :scope => :user)
  end
  
  it "deletes a proudct" do
    product = Product.create(:name => 'Lobster Tails', :cost => '37', :country_of_origin => 'United States of America')
    visit product_path(product)
    click_link 'Delete'
    expect(page).to have_content 'You took the initiative to delete this inferior product. Your ancestors are certainly smiling down on you'
    expect(page).not_to have_content 'Lobster Tails'
  end

end
