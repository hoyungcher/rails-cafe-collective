class AddPriceToBookings < ActiveRecord::Migration[5.2]
  def change
    add_column :bookings, :state, :string
    add_monetize :bookings, :total_credits, currency: { present: false }
    add_column :bookings, :checkout_session_id, :string
  end
end
