class Doctor < ApplicationRecord
	belongs_to :city
	has_many :appointments
	has_many :patients, through: :appointments
	has_and_belongs_to_many :specialties
end
