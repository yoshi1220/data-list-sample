class CreateReservation < ActiveRecord::Migration[5.2]
  def change
    create_table :reservation do |t|
      t.string :user_name
      t.date :reservation_date
      t.boolean :is_reserved
      t.timestamps
    end
  end
end
