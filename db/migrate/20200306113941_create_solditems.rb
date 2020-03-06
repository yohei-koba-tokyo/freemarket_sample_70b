class CreateSolditems < ActiveRecord::Migration[5.2]
  def change
    create_table :solditems do |t|

      t.timestamps
    end
  end
end
