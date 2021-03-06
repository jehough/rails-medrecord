class Appointment < ApplicationRecord
  belongs_to :patient, optional: true
  belongs_to :doctor
  has_many_attached :images

  scope :today, -> {where("date = ?", Date.today)}
  scope :future, -> {where("date >= ?", Date.today)}
  scope :available, -> {where("patient_id IS NULL")}
  scope :past, -> {where("date < ?", Date.today)}

  def display_time
    "#{self.date.strftime("%b %e, %Y")} #{self.time.strftime("%l:%M %P")}"
  end
end
