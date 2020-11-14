# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
30.times do |i|
  if i.odd?
    name = Faker::Creature::Cat.name
    breed = Faker::Creature::Cat.breed
    random_date = Time.at(rand * Time.now.to_i)
    Pet.create(name: name , breed: breed, date_of_birth: random_date, type_of_animal: 'cat' ) do |pet|
      pet.medical_records.build(symptoms: 'Diarreia', treatment: 'vermífogo')
    end
  else
    name = Faker::Creature::Dog.name
    breed = Faker::Creature::Dog.breed #=> "Yorkshire Terrier"
    random_date = Time.at(rand * Time.now.to_i)
    Pet.create(name: name , breed: breed, date_of_birth: random_date, type_of_animal: 'dog' ) do |pet|
      pet.medical_records.build(symptoms: 'Febre', treatment: 'antitérmico')
    end
  end
end