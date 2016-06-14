class CreateDataEntries < ActiveRecord::Migration
  def change
    create_table :data_entries do |t|

      t.timestamps
    end
  end
end
