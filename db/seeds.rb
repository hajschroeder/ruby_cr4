Product.destroy_all
Review.destroy_all 

50.times do |index|
  product = Product.create!(name: Faker::Food.dish, cost: Faker::Number.number(digits: 2), country_of_origin: Faker::Address.country,)


  5.times do |index|
    Review.create!(author: Faker::Fantasy::Tolkien.character, content_body: Faker::Books::Lovecraft.paragraph_by_chars(characters: 75), rating: Faker::Number.between(from: 1, to: 5), product_id: product.id )
  end
  p "Created #{Review.count} reviews"
end
p "Created #{Product.count} products"
