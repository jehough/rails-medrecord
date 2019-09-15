class Medication < ApplicationRecord
  has_many :patient_meds
  has_many :patients, through: :patient_meds
  has_many :dosages

end
