class AddAppointmentIdToDataEntries < ActiveRecord::Migration
  def change
    add_column :data_entries, :appointment_id, :integer
  end
end
