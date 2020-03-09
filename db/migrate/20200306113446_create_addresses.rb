class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.string  :postcode
      t.string  :prefecture
      t.string  :municipality
      t.string  :address
      t.string  :room_number
      t.integer :phone
      t.integer :user_id, null: false, foreign_key: true
      t.timestamps
    end
  end
end
