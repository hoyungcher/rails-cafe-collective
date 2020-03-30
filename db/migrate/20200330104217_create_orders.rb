class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.references :menu_item, foreign_key: true
      t.references :booking, foreign_key: true

      t.timestamps
    end
  end
end
