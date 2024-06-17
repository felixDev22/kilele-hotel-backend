class CreateBookings < ActiveRecord::Migration[7.0]
  def change
    create_table :bookings do |t|
      t.references :user, null: false, foreign_key: true
      t.date :date_of_arrival
      t.date :date_of_departure
      t.integer :adults
      t.integer :children
      t.integer :room
      t.string :room_type
      t.decimal :total_price
      t.string :name
      t.string :email

      t.timestamps
    end
  end
end
