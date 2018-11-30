class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.string :cel_model
      t.string :imei
      t.integer :parcel_number
      t.belongs_to :user, foreign_key: true
      t.decimal :price, precision: 6, scale: 2
      t.integer :status

      t.timestamps
    end
    add_index :orders, :imei, unique: true
  end
end
