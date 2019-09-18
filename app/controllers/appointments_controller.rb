class AppointmentsController < ApplicationController
  before_action :current_patient, only: [:add_patient]

  def show
    @appointment = Appointment.find(params[:id])
  end

  def edit
    @appointment = Appointment.find(params[:id])
  end

  def update
    @appointment = Appointment.find(params[:id])
    @appointment.update(appointment_params)
  end

  def index
    @appointments = Appointment.future
  end

  def add_patient
    @appointment = Appointment.find(params[:id])
    @appointment.patient = @patient
    redirect_to patient_home_path(@patient)
  end

  private
  def appointment_params
    params.require(:appointment).permit(:height, :weight, :bmi, :temp, :systolic, :diastolic, :heart_rate, :spo2, :rr, :visit_reason, :history, :neuro, :heent, :cardiac, :respiratory, :skin, :musculoskeletal, :psychosocial, :therapies, :tests_ordered, :follow_up)
  end
end
