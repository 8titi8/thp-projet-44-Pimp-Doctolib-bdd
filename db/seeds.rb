# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

10.times do # creation de 10 villes 
	city = City.create(name: Faker::Address.city)
end

5.times do # creation de 5 spécialités 
	specialty = Specialty.create(name: Faker::Superhero.power)
end

10.times do  # creation de 10 médecins
	doctor = Doctor.create(first_name: Faker::Name.first_name,
							last_name: Faker::Name.last_name,
							postal_code: Faker::Address.zip_code,
							city_id: rand((City.first.id)..(City.last.id)))
end

10.times do |id| # ajoute successivement pour chaque docteur 2 spécialités aleatoirement
	doctors_specialties = Doctor.find(id+1).specialties << [Specialty.find(rand((Specialty.first.id)..(Specialty.last.id))),  
															Specialty.find(rand((Specialty.first.id)..(Specialty.last.id)))]
	id += 1
end

30.times do # créations de 30 patients
	patient = Patient.create(first_name: Faker::Name.first_name,
							last_name: Faker::Name.last_name,
							city_id: rand((City.first.id)..(City.last.id)))
end

40.times do # création de 40 RDV
	appointment = Appointment.new(date: Faker::Time.forward(365, :day),
								# date max dans 1 an et heure durant la journée
								city_id: rand((City.first.id)..(City.last.id)))
								# ajouter une ville aleatoirement au RDV
	appointment.doctor_id = Doctor.where(city_id: appointment.city_id).pluck(:id).sample
	# ajoute un docteur qui est présent dans la ville du RDV
	appointment.patient_id = Patient.where(city_id: appointment.city_id).pluck(:id).sample
	# ajoute un patient qui est présent dans la ville du RDV et du Docteur
	appointment.save	
end