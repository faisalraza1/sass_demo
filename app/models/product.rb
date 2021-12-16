class Product < ApplicationRecord

	belongs_to :seller
	belongs_to :category
	has_one_attached :image
end
