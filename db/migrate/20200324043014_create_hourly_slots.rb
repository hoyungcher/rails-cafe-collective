class CreateHourlySlots < ActiveRecord::Migration[5.2]
  def change
    create_table :hourly_slots do |t|
      t.references :cafe, foreign_key: true
      t.integer :start_time
      t.integer :total_seats
      t.integer :price_per_hour
      t.date :date

      t.timestamps
    end
  end
end
