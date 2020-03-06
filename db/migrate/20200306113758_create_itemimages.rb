class CreateItemimages < ActiveRecord::Migration[5.2]
  def change
    create_table :itemimages do |t|
      t.string :image,   null: false
      t.string :item_id, null: false, foreign_key: true
      t.timestamps
    end
  end
end
