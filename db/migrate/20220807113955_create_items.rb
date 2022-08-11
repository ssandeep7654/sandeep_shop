class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.string :title
      t.integer :quantity
      t.string :img
      t.float :price
      t.integer :cart_id, null: false
      t.index :cart_id
      t.timestamps
    end
  end
end
