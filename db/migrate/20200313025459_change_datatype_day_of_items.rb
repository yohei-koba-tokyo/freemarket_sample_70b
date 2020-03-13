class ChangeDatatypeDayOfItems < ActiveRecord::Migration[5.2]
  def change
    change_column :items, :day, :string
  end
end
