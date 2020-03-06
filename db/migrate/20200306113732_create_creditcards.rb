class CreateCreditcards < ActiveRecord::Migration[5.2]
  def change
    create_table :creditcards do |t|
      t.integer :cardnumber,     null: false, unique: true
      t.integer :expirationdate, null: false
      t.integer :securitycode,   null: false
      t.integer :user_id,        null: false, foreign_key: true
      t.timestamps
    end
  end
end
