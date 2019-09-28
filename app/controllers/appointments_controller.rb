class AppointmentsController < ApplicationController
  before_action :current_patient, only: [:add_patient]
  before_action :current_doctor, only: [:edit]
  before_action :is_user?, only: [:index, :show, :update]
  before_action :is_admin?, only: [:destroy, :destroy_past, :new]

  def index
    if params[:doctor_id]
      @doctor = Doctor.find(params[:doctor_id])
      @appointments = @doctor.appointments.future
    else
      @appointments = Appointment.future
    end
  end

  def new
    @doctor = Doctor.find(params[:doctor_id])
    @appointment= Appointment.new
  end


  def destroy_past
    @appts = Appointment.all.past.available
    @appts.destroy_all
    flash[:alert] = "Unused Past Appoinments have been cleared."
    render "/admin_tools/tools.html.erb"
  end

  def show
    @appointment = Appointment.find(params[:id])
    if is_patient?
      redirect_to patient_home_path unless (current_patient == @appointment.patient)
    end
  end

  def edit
    @appointment = Appointment.find(params[:id])
    if @appointment.patient.nil?
      flash[:alert] = "No Scheduled Patient at that time"
      redirect_to doctor_appointments_path(@doctor)
    else
      @patient = @appointment.patient
      @patient.patient_meds.build
      @patient.patient_meds.build
    end
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

  def destroy
    @appointment = Appointment.find(params[:id])
    @appointment.destroy
    redirect_to admin_tools_tools_path
  end



  private
  def appointment_params
    params.require(:appointment).permit(:patient_id, :height, :weight, :bmi, :temp, :systolic, :diastolic, :heart_rate, :spo2, :rr, :visit_reason, :history, :neuro, :heent, :cardiac, :respiratory, :skin, :musculoskeletal, :psychosocial, :therapies, :tests_ordered, :follow_up, images: [])
  end
end
