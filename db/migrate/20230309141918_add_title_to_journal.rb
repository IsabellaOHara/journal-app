class AddTitleToJournal < ActiveRecord::Migration[7.0]
  def change
    add_column :journals, :title, :integer
  end
end
