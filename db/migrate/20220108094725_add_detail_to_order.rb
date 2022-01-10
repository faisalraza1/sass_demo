class AddDetailToOrder < ActiveRecord::Migration[6.0]
  def change
    add_column :orders, :mobile, :string
    add_column :orders, :address, :string
  end
end
