class AddGroupToJournals < ActiveRecord::Migration[7.0]
  def change
    add_column :journals, :group, :string
  end
end
