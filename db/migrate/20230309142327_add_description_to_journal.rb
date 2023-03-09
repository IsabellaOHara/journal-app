class AddDescriptionToJournal < ActiveRecord::Migration[7.0]
  def change
    add_column :journals, :description, :integer
  end
end
