class Appointment < ApplicationRecord
belongs_to :patient, optional: true
belongs_to :doctor


scope :today, -> {where("date = ?", Date.today)}
scope :future, -> {where("date >= ?", Date.today)}
scope :available, -> {where("patient_id IS NULL")}

  def display_time
    "#{self.date.strftime("%b %e, %Y")} #{self.time.strftime("%l:%M %P")}"
  end
end
