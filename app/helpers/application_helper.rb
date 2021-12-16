# frozen_string_literal: true

module ApplicationHelper
  def total_price
    card = current_user.card
    card.card_items.sum { |p| p.product.price * p.quantity }
  end
end
