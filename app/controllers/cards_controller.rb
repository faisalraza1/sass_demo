# frozen_string_literal: true

class CardsController < ApplicationController
  def index
    @cards = current_card
  end

  def create
    current_card
    add_to_cart
    redirect_to(cards_path) and return
  end

  def remove_item
    card_item = CardItem.find(params[:card_item_id])
    if card_item.quantity > 1
      card_item.quantity -= 1
      card_item.save
    elsif card_item.quantity == 1
      card_item.destroy
      card_item.save
    end
    redirect_to(cards_path) and return
  end

  private

  def add_to_cart
    card = current_card
    product = Product.find(params[:product_id])
    return if card.product_present(product)

    card.card_items.create(product_id: params[:product_id], quantity: 1)
    flash[:notice] = 'The cart is created and ,you have insert the item successfully'
    redirect_to(product_path(params[:product_id])) and return
  end
end
