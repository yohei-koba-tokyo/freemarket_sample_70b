class AddSendnameFirstToAddresses < ActiveRecord::Migration[5.2]
  def change
    add_column :addresses, :sendname_first, :string, null: false
  end
end
