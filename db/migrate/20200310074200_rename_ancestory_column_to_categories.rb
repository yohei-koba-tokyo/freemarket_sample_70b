class RenameAncestoryColumnToCategories < ActiveRecord::Migration[5.2]
  def change
    rename_column :categories, :ancestory, :ancestry
  end
end
