class AddSendnameLastToAddresses < ActiveRecord::Migration[5.2]
  def change
    add_column :addresses, :sendname_last, :string, null: false
  end
end
