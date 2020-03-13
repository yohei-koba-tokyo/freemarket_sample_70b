class ChangeDatatypePostageOfItems < ActiveRecord::Migration[5.2]
  def change
    change_column :items, :postage, :string
  end
end
