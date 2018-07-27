class CreateDoctorsSpecialtiesJoinTable < ActiveRecord::Migration[5.2]
  def change
    create_join_table :doctors, :specialties do |t|
      t.references :doctor, foreign_key: true
      t.references :specialty, foreign_key: true
    end
  end
end
