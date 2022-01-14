# frozen_string_literal: true

class Seller < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :products
  has_many :categories

  def show_ordered_product(seller)
    Item.joins(product: :seller).where(products: { seller_id: seller.id })
  end
end
