class CreateProducts < ActiveRecord::Migration[7.1]
  def change
    create_table :products do |t|
      t.string :name
      t.decimal :price
      t.string :category
      t.decimal :rating
      t.integer :rating_count
      t.text :description
      t.string :image

      t.timestamps
    end
  end
end
