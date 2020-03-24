class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.references :user, foreign_key: true
      t.date :date
      t.integer :start_time
      t.integer :duration
      t.string :special_requests
      t.integer :total_credits
      t.integer :remaining_credits

      t.timestamps
    end
  end
end
