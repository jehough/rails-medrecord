class Doctor < ApplicationRecord
  has_secure_password
  has_many :appointments
  has_many :patients, through: :appointments
  has_many :doc_scheds
  has_one_attached :profile_pic
  validates :username, presence: true
  validates :password, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  def doc_name
    "Dr. #{self.first_name} #{self.last_name}"
  end
end
