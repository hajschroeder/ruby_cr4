class ProductsController < ApplicationController
  before_action :authenticate_user!, :only => [:new, :edit, :destroy] do
    redirect_to new_user_session_path unless current_user && current_user.admin
  end

  def index
    @products = Product.all
    render :index
  end

  def home 
    @products = Product.all 
    render :home 
  end
  
  def new 
    @product = Product.new
    render :new
  end

  def create 
    @product = Product.new(product_params)
    if @product.save
      flash[:notice] = "Product has been added. Thank you for your contribution"
      redirect_to products_path
    else 
      render :new
    end
  end

  def edit 
    @product = Product.find(params[:id])
    render :edit
  end

  def show
    @product = Product.find(params[:id])
    render :show
  end

  def update 
    @product = Product.find(params[:id])
    if @product.update(product_params)
      flash[:notice] = "You have successfully updated this product. We are so proud of you"
      redirect_to products_path
    else
      render :edit
    end
  end

  def destroy 
    @product = Product.find(params[:id])
    @product.destroy
    flash[:notice] = "You took the initiative to delete this inferior product. Your ancestors are certainly smiling down on you"
    redirect_to products_path
  end


  private 
    def product_params
      params.require(:product).permit(:name, :cost, :country_of_origin)
    end

end
