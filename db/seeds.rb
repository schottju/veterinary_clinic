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
inny = Species.create!(name: 'inny')
kot = Species.create!(name: 'kot')
pies = Species.create!(name: 'pies')
krowa = Species.create!(name: 'krowa')
swinia = Species.create!(name: 'świnia')
kura = Species.create!(name: 'kura')

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

#Animals
Animal.create!(id_number: '1234566', name: 'Miła', birth_date: DateTime.new(2011, 9, 15), amount: 1, weight: '', gender: :samica, description: 'W czarne łaty', user_id: justyna.id, species_id: krowa.id)
Animal.create!(id_number: 'PL4245', amount: 13, gender: :mieszana, description: '', user_id: justyna.id, species_id: kura.id)
Animal.create!(id_number: '345234534', amount: 20, weight: 100, gender: :mieszana, age: 2, description: 'Mieszane stado w różnym wieku, waga od 100 do 150 kg', user_id: justyna.id, species_id: swinia.id)
Animal.create!(id_number: 'PL13434NN', name: 'Burek', birth_date: DateTime.new(2010, 11, 15), amount: 1, weight: 2.5, gender: :samiec, description: 'Bury kot', user_id: jan.id, species_id: kot.id)
