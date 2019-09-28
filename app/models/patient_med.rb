class PatientMed < ApplicationRecord
  belongs_to :medication
  belongs_to :patient
  validates :dosage, presence: true
  validates :instructions, presence: true
end
