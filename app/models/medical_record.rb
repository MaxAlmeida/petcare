class MedicalRecord < ApplicationRecord
  belongs_to :pet

  validates :symptoms, presence: true
  validates :treatment, presence: true
end