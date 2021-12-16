# frozen_string_literal: true

class Card < ApplicationRecord
  belongs_to :user
  has_many :card_items
  has_many :products, through: :cart_items, source: :product

  def product_present(product)
    card_item = card_items.find_by_product_id(product.id)
    unless card_item.nil?
      
      card_item.quantity += 1
      card_item.save
    end
  end
end
