require 'rails_helper'

describe "the edit a review process" do 
  it "edits a review" do 
    product = Product.create(:name => 'Lobster Tails', :cost => '37', :country_of_origin => 'United States of America')
    review = Review.create(:author => 'The FlyEater', :content_body => 'lorem ipsum we gotta get up to at least fifty characters for this to work', :rating => 2, :product_id => product.id)
    visit product_review_path(product, review)
    click_link 'Edit'
    fill_in 'Author', :with => 'Snail King'
    fill_in 'Rating', :with => 4
    click_on 'Update Review'
    expect(page).to have_content "Wow, what a brilliant update you've made here."

  end

  it "provides an error if the editor tries to leave a field blank" do 
    product = Product.create(:name => 'Lobster Tails', :cost => '37', :country_of_origin => 'United States of America')
    review = Review.create(:author => 'The FlyEater', :content_body => 'lorem ipsum we gotta get up to at least fifty characters for this to work', :rating => 2, :product_id => product.id)
    visit edit_product_review_path(product, review)
    fill_in 'Author', :with => ''
    click_on 'Update Review'
    expect(page).to have_content "Author can't be blank"
  end
end
