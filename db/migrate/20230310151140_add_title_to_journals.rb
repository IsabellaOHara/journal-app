class AddTitleToJournals < ActiveRecord::Migration[7.0]
  def change
    add_column :journals, :title, :string
  end
end
