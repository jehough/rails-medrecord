class DocSched < ApplicationRecord
  belongs_to :doctor


  def make_appointments
    time = self.shift_start
    while time < self.shift_end do
      Appointment.create(doctor: self.doctor, date: self.date, time: time)
      time += 900
    end
  end
end
