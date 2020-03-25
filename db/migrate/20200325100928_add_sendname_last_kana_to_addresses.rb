class AddSendnameLastKanaToAddresses < ActiveRecord::Migration[5.2]
  def change
    add_column :addresses, :sendname_last_kana, :string, null: false
  end
end
