# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :card
  has_many :orders

  def order_product
    orders = self.orders
    orders.map { |order| order.items.where(itemable_id: order.id) }.flatten
  end
end
