class AddPurchasedToProducts < ActiveRecord::Migration[7.0]
  def change
    add_column :products, :purchased, :boolean
  end
end
