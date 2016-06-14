class AddUuidToPatients < ActiveRecord::Migration
  def change
    add_column :patients, :uuid, :string
  end
end
