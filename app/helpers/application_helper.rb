# frozen_string_literal: true

module ApplicationHelper
  def total_price
    card = current_user.card
    card.items.sum { |p| p.product.price * p.quantity }
  end
end
