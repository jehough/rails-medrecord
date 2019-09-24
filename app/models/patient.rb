class Patient < ApplicationRecord
  has_secure_password
  has_many :appointments
  has_many :doctors, through: :appointments
  has_many :patient_meds
  has_many :medications, through: :patient_meds
  validates :email, presence: true
  accepts_nested_attributes_for :patient_meds
  accepts_nested_attributes_for :appointments

  def appointment_attributes=(appointment)
    self.appointment = Appointment.find(appointment[:id])
    self.appointment.update(appointment)
  end


  def display_name
    "#{self.first_name} #{self.last_name}"
  end
end
