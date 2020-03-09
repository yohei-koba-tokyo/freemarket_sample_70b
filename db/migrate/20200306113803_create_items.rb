class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string  :name,        null: false
      t.text    :explanation, null: false
      t.string  :brand
      t.string  :condition,   null: false
      t.integer :postage,     null: false
      t.string  :area,        null: false
      t.integer :day
      t.integer :price
      t.text    :profile
      t.integer :user_id,     null: false, foreign_key: true
      t.integer :status
      t.timestamps
    end
  end
end
