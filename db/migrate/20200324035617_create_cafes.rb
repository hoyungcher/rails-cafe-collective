class CreateCafes < ActiveRecord::Migration[5.2]
  def change
    create_table :cafes do |t|
      t.string :name
      t.string :description
      t.string :neighbourhood
      t.string :address
      t.string :city
      t.string :category
      t.string :contact
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
