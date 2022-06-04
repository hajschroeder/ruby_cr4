require 'rails_helper'

describe Product do
  it("titleizes the name of the product") do 
    product = Product.create({name: "french fries", cost: 5, country_of_origin: "belgium"})
    expect(product.name()).to eq("French Fries")
  end

  it { should have_many :reviews }
  it { should validate_presence_of :name }
  it { should validate_presence_of :cost }
  it { should validate_presence_of :country_of_origin }
  
end