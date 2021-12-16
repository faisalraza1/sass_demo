class CreateCardItems < ActiveRecord::Migration[6.0]
  def change
    create_table :card_items do |t|
      t.string :card_id
      t.string :product_id

      t.timestamps
    end
  end
end
