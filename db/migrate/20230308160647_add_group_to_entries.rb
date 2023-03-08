class AddGroupToEntries < ActiveRecord::Migration[7.0]
  def change
    add_column :entries, :group, :string
  end
end
