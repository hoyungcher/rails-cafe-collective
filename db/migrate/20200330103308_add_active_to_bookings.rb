class AddActiveToBookings < ActiveRecord::Migration[5.2]
  def change
    add_column :bookings, :active, :boolean, default: false
  end
end
