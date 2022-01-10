class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :itemable_id
      t.string :itemable_type
      t.string :product_id
      t.integer :quantity

      t.timestamps
    end
  end
end
