class CreateItemimages < ActiveRecord::Migration[5.2]
  def change
    create_table :itemimages do |t|

      t.timestamps
    end
  end
end
