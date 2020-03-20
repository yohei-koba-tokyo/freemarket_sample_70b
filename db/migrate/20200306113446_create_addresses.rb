class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.string  :postcode, null: false
      t.string  :prefecture, null: false
      t.string  :municipality, null: false
      t.string  :address, null: false
      t.string  :room_number
      t.integer :phone, null: false
      t.integer :user_id, null: false, foreign_key: true
      t.timestamps
      
    end
  end
end
