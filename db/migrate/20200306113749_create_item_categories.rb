class CreateItemCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :item_categories do |t|
      t.string :category_id, null: false, foreign_key: true
      t.string :item_id,     null: false, foreign_key: true
      t.timestamps
    end
  end
end
