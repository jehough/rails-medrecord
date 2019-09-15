class Patient < ApplicationRecord
  has_many :appointments
  has_many :doctors, through: :appointments
  has_many :patient_meds
  has_many :medications, through: :patient_meds

end
