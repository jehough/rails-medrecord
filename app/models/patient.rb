class Patient < ApplicationRecord
  has_secure_password
  has_many :appointments
  has_many :doctors, through: :appointments
  has_many :patient_meds
  has_many :medications, through: :patient_meds
  validates :email, presence: true
  validates :email, uniqueness: true


  def appointments_attributes=(appointment)
    @appointment = Appointment.find(appointment[:id])
    @appointment.update(appointment)
  end

  def patient_meds_attributes=(medications)

    medications.each do |k,v|
      if @patient_med = PatientMed.find_by(id: v[:id])
        @patient_med.update(v)
      else
        v[:patient_id] = self.id
        @patient_med = PatientMed.create(v)
      end
    end
  end

  def display_name
    "#{self.first_name} #{self.last_name}"
  end

  def self.facebook_first(name)
    name = name.split(' ')
    name[0]
  end

  def self.facebook_last(name)
    name = name.split(' ')
    name[1]
  end
end
