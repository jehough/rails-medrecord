class Doctor < ApplicationRecord
  has_secure_password
  has_many :appointments
  has_many :patients, through: :appointments
  has_many :doc_scheds
  has_one_attached :profile_pic

  def doc_name
    "Dr. #{self.first_name} #{self.last_name}"
  end
end
