class AppointmentsController < ApplicationController
  before_action :current_patient, only: [:add_patient]

  def show
    @appointment = Appointment.find(params[:id])
  end

  def edit
    @appointment = Appointment.find(params[:id])
  end


  def index
    @appointments = Appointment.future
  end

  def update
    @appointment = Appointment.find(params[:id])
    @appointment.update(appointment_params)
    if is_patient?
      redirect_to patient_home_path(params[:appointment][:patient_id])
    elsif is_doctor?
      redirect_to doctor_home_path(current_doctor)
    end
  end

  def add_patient
    @appointment = Appointment.find(params[:appointment_id])
    @appointment.patient = @patient
    @appointment.save
    redirect_to patient_home_path(@patient)
  end

  private
  def appointment_params
    params.require(:appointment).permit(:patient_id, :height, :weight, :bmi, :temp, :systolic, :diastolic, :heart_rate, :spo2, :rr, :visit_reason, :history, :neuro, :heent, :cardiac, :respiratory, :skin, :musculoskeletal, :psychosocial, :therapies, :tests_ordered, :follow_up)
  end
end
