class Pet < ApplicationRecord
  validates :name, presence: true
  enum type_of_animal: { dog: 0, cat: 1}
end
