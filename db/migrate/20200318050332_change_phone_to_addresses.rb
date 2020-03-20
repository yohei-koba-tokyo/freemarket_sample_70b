class ChangePhoneToAddresses < ActiveRecord::Migration[5.2]
  def change
    change_column :addresses, :phone, :string, null: false
  end
end

