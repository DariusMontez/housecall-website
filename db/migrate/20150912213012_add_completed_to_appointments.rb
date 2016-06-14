class AddCompletedToAppointments < ActiveRecord::Migration
  def change
    add_column :appointments, :completed, :boolean
  end
end
