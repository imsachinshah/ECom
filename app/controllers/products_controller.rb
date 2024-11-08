class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      redirect_to @product, notice: 'Product updated successfully.'
    else
      render :edit
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to products_path, notice: 'Product deleted successfully.'
  end

  def sync
    ProductApiService.call
    redirect_to products_path, notice: 'Products synced successfully.'
  end

  def add_to_cart
    @cart = Cart.first_or_create
    product_ids = params[:product_ids]
    unless product_ids.nil? 
      product_ids&.each do |id|
        @cart.products << Product.find(id)
      end
    end
    redirect_to cart_path(@cart), notice: 'Products added to cart.'
  end

  private

  def product_params
    params.require(:product).permit(:name, :rating, :rating_count, :description, :image_url)
  end
end
