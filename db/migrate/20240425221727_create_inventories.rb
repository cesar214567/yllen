class CreateInventories < ActiveRecord::Migration[6.1]
  def change
    create_table :inventories do |t|
      t.references :item, null: false, foreign_key: true
      t.string :inventory_type, limit: 40, null: false
      t.integer :quantity

      t.timestamps
    end
  end
end
