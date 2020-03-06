class CreateSolditems < ActiveRecord::Migration[5.2]
  def change
    create_table :solditems do |t|
      t.integer :item_id, null: false, foreign_key: true
      t.string  :user_id, null: false, foreign_key: true
      t.timestamps
    end
  end
end
