class PatientMeds < ApplicationRecord
  belongs_to :medication
  belongs_to :patient
end
