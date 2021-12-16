class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :name
      t.string :description
      t.string :price
      t.string :image
      t.integer :seller_id
      t.integer :category_id

      t.timestamps
    end
  end
end


