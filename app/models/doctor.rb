class Doctor < ApplicationRecord
  has_secure_password
  has_many :appointments
  has_many :patients, through: :appointments
  has_many :doc_scheds

  def doc_name
    "Dr. #{self.first_name} #{self.last_name}"
  end
end
