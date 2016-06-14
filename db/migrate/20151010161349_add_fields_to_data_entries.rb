class AddFieldsToDataEntries < ActiveRecord::Migration
  def change
    add_column :data_entries, :classification, :string
    add_column :data_entries, :value, :string
    add_column :data_entries, :unit, :string
  end
end
