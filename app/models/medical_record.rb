class MedicalRecord < ApplicationRecord
  belongs_to :pet

  validates :symptoms, presence: true
  validates :treatment, presence: true

  def csv_colums_values
    [id, pet.name, pet.breed, pet.type_of_animal, symptoms, treatment]
  end

end