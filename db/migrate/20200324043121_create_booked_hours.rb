class CreateBookedHours < ActiveRecord::Migration[5.2]
  def change
    create_table :booked_hours do |t|
      t.references :booking, foreign_key: true
      t.references :hourly_slot, foreign_key: true
      t.boolean :paid?

      t.timestamps
    end
  end
end
