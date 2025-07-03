class CreateAppointments < ActiveRecord::Migration[8.0]
  def change
    create_table :appointments do |t|
      t.datetime :start_time_at
      t.datetime :end_time_at
      t.belongs_to :customer, null: false, foreign_key: true
      t.belongs_to :professional, null: false, foreign_key: true

      t.timestamps
    end
  end
end
