FactoryBot.define do
  factory :pet do
    name { 'Pitoco' }
    date_of_birth { 5.year.ago}
    type_of_animal { 'dog'}
    breed { 'Vira lata' }
  end
end  