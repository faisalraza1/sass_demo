class Seller::ProductsController < ApplicationController 
  def index
    @products = current_seller.products
  end

  def create
    @product = current_seller.products.create(product_params)
    @product.save
    redirect_to seller_products_path
  end

  def new
    @product = Product.new
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    @product.update(product_params)
    redirect_to seller_products_path
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to seller_products_path
  end

   def ordered_product
    @seller = current_seller
    @seller_products = @seller.show_ordered_product(@seller)
   end

private
   def product_params
    params.require(:product).permit(:name,:description,:price,:category_id,:image)
   end
end
