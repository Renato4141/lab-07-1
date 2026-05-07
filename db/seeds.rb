# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end


Treatment.destroy_all
Appointment.destroy_all
Pet.destroy_all
Owner.destroy_all
Vet.destroy_all

owner1 = Owner.create(first_name: "Juan Carlos", last_name: "Bodoque", email: "bancodetitirilquen@gmail.com", phone: "458674", address: "Titirilkquen 4")
owner2 = Owner.create(first_name: "Juanin Juan", last_name: "Harry", email: "juaninjh@gmail.com", phone: "654321", address: "Isla de Cachirula")
owner3 = Owner.create(first_name: "Mario", last_name: "Hugo", email: "mhugo@gmail.com", phone: "987654", address: "esquina de Ministro Carvajal con Ministro Carvajal")

pet1 = owner1.pets.create(name: "Estalagtimitiquita", species: "dog", breed: "Labrador", date_of_birth: "2020-01-01", weight: 25.5)
pet2 = owner1.pets.create(name: "Carambolas", species: "cat", breed: "Siamese", date_of_birth: "2020-05-10", weight: 5.2)
pet3 = owner2.pets.create(name: "Barney", species: "rabbit", breed: "Mini Lop", date_of_birth: "2020-03-15", weight: 2.1)
pet4 = owner3.pets.create(name: "Gonzo", species: "dog", breed: "Bulldog", date_of_birth: "2020-07-20", weight: 20.0)
pet5 = owner2.pets.create(name: "Lunares", species: "cat", breed: "Persian", date_of_birth: "2020-11-11", weight: 4.8)

pet1.photo.attach(
  io: File.open(Rails.root.join("db/seeds/pets/Perro1.jpg")),
  filename: "Perro1.jpeg",
  content_type: "image/jpeg"
)

pet2.photo.attach(
  io: File.open(Rails.root.join("db/seeds/pets/Gato1.jpg")),
  filename: "Gato1.jpeg",
  content_type: "image/jpeg"
)

pet3.photo.attach(
  io: File.open(Rails.root.join("db/seeds/pets/Conejo1.jpg")),
  filename: "Conejo1.jpeg",
  content_type: "image/jpeg"
)

vet1 = Vet.create(first_name: "Anabela", last_name: "Silvanus", email: "anabela@vet.com", phone: "111111", specialization: "General")
vet2 = Vet.create(first_name: "Cabro", last_name: "Cabreras", email: "cabracobra@vet.com", phone: "222222", specialization: "Surgery")

app1 = Appointment.create(pet: pet1, vet: vet1, date: 3.days.from_now, reason: "Checkup", status: 0)
app2 = Appointment.create(pet: pet2, vet: vet1, date: 1.day.from_now, reason: "Vaccination", status: 1)
app3 = Appointment.create(pet: pet3, vet: vet2, date: 2.days.ago, reason: "Injury", status: 2)
app4 = Appointment.create(pet: pet4, vet: vet2, date: 5.days.ago, reason: "Surgery", status: 2)
app5 = Appointment.create(pet: pet5, vet: vet1, date: 1.day.ago, reason: "Skin issue", status: 3)

t1 = Treatment.new(
  appointment: app2,
  name: "Antibiotic",
  medication: "Amoxicillin",
  dosage: "2x daily",
  administered_at: Time.now
)
t1.clinical_notes = "Infection"
t1.save!

t2 = Treatment.new(
  appointment: app3,
  name: "Pain relief",
  medication: "Ibuprofen",
  dosage: "1x daily",
  administered_at: Time.now
)
t2.clinical_notes = "Post injury"
t2.save!

t3 = Treatment.new(
  appointment: app4,
  name: "Post surgery",
  medication: "Antibiotics",
  dosage: "3x daily",
  administered_at: Time.now
)
t3.clinical_notes = "Recovery"
t3.save!

t4 = Treatment.new(
  appointment: app2,
  name: "Vitamin",
  medication: "Vit C",
  dosage: "1x daily",
  administered_at: Time.now
)
t4.clinical_notes = "Immune boost"
t4.save!

t5 = Treatment.new(
  appointment: app3,
  name: "Bandage",
  medication: "None",
  dosage: "N/A",
  administered_at: Time.now
)
t5.clinical_notes = "Wound care"
t5.save!

