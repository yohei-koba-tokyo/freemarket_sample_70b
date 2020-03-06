class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.string :item_id, null: false, foreign_key: true
      t.string :user_id, null: false, foreign_key: true
      t.text   :brand
      t.timestamps
    end
  end
end
