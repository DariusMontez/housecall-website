class AddNodeIdToPatients < ActiveRecord::Migration
  def change
    add_column :patients, :node_id, :integer, index: true
  end
end
