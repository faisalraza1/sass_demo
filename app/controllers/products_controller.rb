# frozen_string_literal: true

class ProductsController < ApplicationController
  def index
    @product = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def user_ordered_product
    user = current_user
    @order_product = user.order_product
  end
end
