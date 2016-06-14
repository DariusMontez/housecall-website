class AddAppointmentIdIndexToDataEntries < ActiveRecord::Migration
  def change
  	add_index :data_entries, :appointment_id
  end
end
