class DocSched < ApplicationRecord
  belongs_to :doctor
  validates :date, :shift_start, :shift_end, presence: true
  validate :checks_shift_times


  def make_appointments
    time = self.shift_start
    while time < self.shift_end do
      Appointment.create(doctor: self.doctor, date: self.date, time: time)
      time += 900
    end
  end

  def checks_shift_times
    if self.shift_end < self.shift_start
      errors.add(:schedule_error, "Shift cannot end before it starts")
    end
  end
end
