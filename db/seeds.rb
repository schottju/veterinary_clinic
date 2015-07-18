# Veterinarian.create!(title: '', specialization: '', pwz: '', user_id: veterinarian)
# User.new(first_name: '', last_name: '', email: '', pesel: '', phone_number: '', role: , password: 'password', password_confirmation: 'password')
# Address.create!(street: '', house_number: '', flat_number: '', zip_code: '', city: '', borough: '', district: '', province: '', country: '', user_id: )
# Species.create!(name: '')

#Patients
edward = User.new(first_name: 'Edward', last_name: 'Wojtak', email: 'daktyr@o2.pl', pesel: '12345678911', phone_number: '123456781', role: :patient, password: 'password', password_confirmation: 'password')
edward.skip_confirmation!
edward.save!

justyna = User.new(first_name: 'Justyna', last_name: 'Kowal', email: 'daktyr@go2.pl', pesel: '12345678912', phone_number: '123456782', role: :patient, password: 'password', password_confirmation: 'password')
justyna.skip_confirmation!
justyna.save!

jan = User.new(first_name: 'Jan', last_name: 'Nowak', email: 'daktyr@tlen.pl', pesel: '12345678913', phone_number: '123456783', role: :patient, password: 'password', password_confirmation: 'password')
jan.skip_confirmation!
jan.save!

#Veterinarians
veterinarian = User.new(first_name: 'Adam', last_name: 'Winiarczyk', email: 'daktyr@gmail.com', pesel: '12345678901', phone_number: '123456789', role: :veterinarian, password: 'password', password_confirmation: 'password')
veterinarian.skip_confirmation!
veterinarian.save!

Veterinarian.create!(title: 'lek. wet.', specialization: 'zwierzęta hodowlane', pwz: '01234', user_id: veterinarian.id)

#Admin
admin = User.new(first_name: 'Admin', last_name: 'Administrator', email: 'admin@example.com', pesel: '12345678900', phone_number: '123456780', role: :admin, password: 'password', password_confirmation: 'password')
admin.skip_confirmation!
admin.save!

#Addresses
Address.create!(street: 'Kilińskiego', house_number: '12', flat_number: '44', zip_code: '37-400', city: 'Nisko', borough: 'Nisko', district: 'Niżański', province: 'podkarpackie', country: 'PL', user_id: edward.id)
Address.create!(street: 'Kościuszki', house_number: '4A', flat_number: '5', zip_code: '37-400', city: 'Nisko', borough: 'Nisko', district: 'Niżański', province: 'podkarpackie', country: 'PL', user_id: justyna.id)
Address.create!(street: 'Bema', house_number: '123', flat_number: '', zip_code: '37-400', city: 'Nisko', borough: 'Nisko', district: 'Niżański', province: 'podkarpackie', country: 'PL', user_id: jan.id)
Address.create!(street: 'Krótka', house_number: '22', flat_number: '', zip_code: '37-400', city: 'Nisko', borough: 'Nisko', district: 'Niżański', province: 'podkarpackie', country: 'PL', user_id: veterinarian.id)
Address.create!(street: 'Adminowa', house_number: '12', flat_number: '3', zip_code: '37-400', city: 'Nisko', borough: 'Niżański', district: 'niżański', province: 'podkarpackie', country: 'PL', user_id: admin.id)

#Species
species_names = [ 'inny', 'kot', 'pies', 'krowa', 'świnia', 'kura' ]
species_names.each { |name| Species.create!(name: name) }

#Units
unit_names = [ 'kg', 'ml', 'l', 'mg' ]
unit_names.each { |name| Unit.create!(name: name) }
