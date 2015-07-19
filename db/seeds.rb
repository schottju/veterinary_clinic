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
units_names = [ 'kg', 'ml', 'l', 'mg' ]
units_names.each { |name| Unit.create!(name: name) }

#Diseases
diseases_names = [ 'Padaczka', 'Wścieklizna', 'Pomór' ]
diseases_names.each { |name| Disease.create!(name: name) }

#Treatments
Treatment.create!(name: 'Poród', cost: 100, description: 'Odebranie porodu')
Treatment.create!(name: 'Porada', cost: 30, description: 'Porada lekarska')
Treatment.create!(name: 'Diagnostyka', cost: 50, description: 'Rozpoznanie choroby')
Treatment.create!(name: 'Szczepienie', cost: 20, description: 'Wykonanie szczepienia')
Treatment.create!(name: 'Badania I', cost: 50, description: 'Podstawowe badania')
Treatment.create!(name: 'Badania II', cost: 50, description: 'Badania uzupełniające')
Treatment.create!(name: 'Pobranie próbki', cost: 50, description: 'Pobranie próbki do badań laboratoryjnych')
