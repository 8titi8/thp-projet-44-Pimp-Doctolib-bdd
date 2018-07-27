class CreateAppointments < ActiveRecord::Migration[5.2]
  def change
    create_table :appointments do |t|
      t.datetime :date
      t.references :patient, foreign_key: true
      t.references :doctor, foreign_key: true
      t.references :city, foreign_key: true

      t.timestamps
    end
  end
end
