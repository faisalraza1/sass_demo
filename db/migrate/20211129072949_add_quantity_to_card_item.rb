class AddQuantityToCardItem < ActiveRecord::Migration[6.0]
  def change
    add_column :card_items, :quantity, :integer
  end
end
