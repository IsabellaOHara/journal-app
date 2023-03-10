class AddDescriptionToJournals < ActiveRecord::Migration[7.0]
  def change
    add_column :journals, :description, :string
  end
end
