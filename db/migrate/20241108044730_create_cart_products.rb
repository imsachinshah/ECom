class CreateCartProducts < ActiveRecord::Migration[7.1]
  def change
    create_table :cart_products do |t|
      t.references :cart
      t.references :product

      t.timestamps
    end
  end
end
