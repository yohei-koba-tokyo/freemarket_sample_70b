class AddSendnameFirstKanaToAddresses < ActiveRecord::Migration[5.2]
  def change
    add_column :addresses, :sendname_first_kana, :string, null: false
  end
end
