class CreateSellers < ActiveRecord::Migration[6.0]
  def change
    create_table :sellers do |t|
      t.string :first_name
      t.string :last_name
      t.string :number
      t.string :address

      t.timestamps
    end
  end
end
