class CreateBookings < ActiveRecord::Migration[7.1]
  def change
    create_table :bookings do |t|
      t.references :dog, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.date :start_time
      t.date :end_time
      t.float :total_price
      t.string :status

      t.timestamps
    end
  end
end
