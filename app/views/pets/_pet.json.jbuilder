json.extract! pet, :id, :name, :date_of_birth, :breed, :type_of_animal, :created_at, :updated_at
json.url pet_url(pet, format: :json)
