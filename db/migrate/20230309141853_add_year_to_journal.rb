class AddYearToJournal < ActiveRecord::Migration[7.0]
  def change
    add_column :journals, :year, :integer
  end
end
