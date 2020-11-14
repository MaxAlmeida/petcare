class Pet < ApplicationRecord
  validates :name, presence: true
  has_many :medical_records, dependent: :destroy
  enum type_of_animal: { dog: 0, cat: 1}
end
