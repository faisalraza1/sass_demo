class RemoveColumnFromItem < ActiveRecord::Migration[6.0]
  def change
    remove_column :items, :mobile
    remove_column :items, :address
  end
end
