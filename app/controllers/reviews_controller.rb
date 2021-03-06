class ReviewsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  before_action :only => [ :edit, :update, :destroy] do
    redirect_to new_user_session_path unless current_user && current_user.admin
  end

  def new
    @product = Product.find(params[:product_id])
    @review = @product.reviews.new 
    render :new
  end

  def create 
    @product = Product.find(params[:product_id])
    @review = @product.reviews.new(review_params)
    if @review.save 
      flash[:notice] = "Thank you for your review. It means so much" 
      redirect_to product_path(@product)
    else
      render :new
    end
  end

  def show 
    @product = Product.find(params[:product_id])
    @review = Review.find(params[:id])
    render :show
  end

  def edit
    @product = Product.find(params[:product_id])
    @review = Review.find(params[:id])
    render :edit
  end

  def update 
    @review = Review.find(params[:id])
    if @review.update(review_params)
      flash[:notice] = "Wow, what a brilliant update you've made here."
      redirect_to product_path(@review.product)
    else
      @product = Product.find(params[:product_id])
      render :edit
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    flash[:notice] = "Discretion is the better part of valor. I appreciate yours"
    redirect_to product_path(@review.product)
  end




  private 
    def review_params
      params.require(:review).permit(:author, :content_body, :rating)
    end

end
