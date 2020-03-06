class CreateSolditems < ActiveRecord::Migration[5.2]
  def change
    create_table :so    create_table :solditems do |t|
      t.integer :item_id, null: false, foreign_key: true
      t.string  :user_id, null: false, foreign_key: truelditems do |t|
      t.timestamps
    end
  end
end
