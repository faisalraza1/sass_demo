# frozen_string_literal: true

class CardsController < ApplicationController
  def index
    @cards = current_card
  end

  def create
    current_card
    add_to_item
    flash[:notice] = 'The cart is created and ,you have insert the item successfully'
    redirect_to(cards_path) and return
  end

  def remove_item
    card_item = Item.find(params[:item_id])
    if card_item.quantity > 1
      card_item.quantity -= 1
      card_item.save
    elsif card_item.quantity == 1
      card_item.destroy
      card_item.save
    end
    redirect_to(cards_path) and return
  end

  def order
    order = Order.create(order_params)
    if order.save
      card = current_card
      card.items.update(itemable_id: order.id, itemable_type: 'Order')
      flash[:notice] = 'you have ordered successfully'
      redirect_to(dashboards_path) and return
    else
      flash[:notice] = 'Please check order is not created'
      redirect_to(cards_path) and return
    end
  end

  private

  def add_to_item
    card = current_card
    product = Product.find(params[:product_id])
    return if card.product_present(product)

    card.items.create(product_id: params[:product_id], quantity: 1)
  end

  def order_params
    params.require(:order).permit(:user_id, :mobile, :address)
  end
end
