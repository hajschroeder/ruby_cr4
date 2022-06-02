class ReviewsController < ApplicationController
  def new
    @product = Product.find(params[:id])
    @review = @product.reviews.new 
    render :new
  end
end
