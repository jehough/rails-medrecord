class Patient < ApplicationRecord
  has_secure_password
  has_many :appointments
  has_many :doctors, through: :appointments
  has_many :patient_meds
  has_many :medications, through: :patient_meds
  validates :email, presence: true

  def display_name
    "#{self.first_name} #{self.last_name}"
  end
end
