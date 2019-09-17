class Appointment < ApplicationRecord
belongs_to :patient, optional: true
belongs_to :doctor
has_one :macro

scope :today, -> {where("date = ?", Date.today)}

  def display_time
    "#{self.date.strftime("%b %e, %Y")} #{self.time.strftime("%l:%M %P")}"
  end
end
