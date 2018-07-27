class Appointment < ApplicationRecord
	has_one :patient
	has_one :doctor
	has_one :city
end
