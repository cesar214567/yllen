class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.string :name
      t.string :description
      t.integer :quantity
      t.references :subtype, null: false, foreign_key: true
      t.float :price
      t.boolean :enabled

      t.timestamps
    end
  end
end
