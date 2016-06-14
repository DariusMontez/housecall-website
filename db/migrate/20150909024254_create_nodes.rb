class CreateNodes < ActiveRecord::Migration
  def change
    create_table :nodes do |t|
      t.string :mac_address
      t.integer :location_id, index: true

      t.timestamps
    end
  end
end
