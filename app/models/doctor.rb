class Doctor < ApplicationRecord
  has_secure_password
  has_many :appointments
  has_many :patients, through: :appointments
  has_many :schedules
end
