class Order < ApplicationRecord

 belongs_to :user
 # belongs_to :card_item
 has_many :items, as: :itemable
 # has_and_belongs_to_many :card_items
                            
end
