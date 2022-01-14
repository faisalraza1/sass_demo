# frozen_string_literal: true

class DashboardsController < ApplicationController
  def index
    @products = if seller_signed_in?
                  current_seller.products
                else
                  Product.all
                end
  end
end
