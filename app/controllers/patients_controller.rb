require 'pry'
class PatientsController < ApplicationController
  before_action :current_patient, only: :home
  before_action :is_doctor?, only: [:update]
  before_action :current_doctor, only: [:index, :show]
  before_action :is_admin?, only: [:new, :create, :edit, :destroy]



  def home

  end

  def index
    if @doctor.admin
      @patients = Patient.all
      if params[:search]
        @patients = @patients.where('last_name LIKE ?', "%#{params[:search]}%")
      end
    else
      @patients = @doctor.patients.uniq
      if params[:search]
        @patients = @patients.where('last_name LIKE ?', "%#{params[:search]}%")
      end
    end
  end

  def show
    if @doctor.admin
      @patient = Patient.find(params[:id])
      @appointments = Appointment.future.available
      render :admin_show
    else
      @patient = Patient.find(params[:id])
    end
  end

  def update
    @patient = Patient.find(params[:id])
    @patient.update(patient_params)
    redirect_to doctor_home_path(current_doctor)
  end

  def new
    @patient = Patient.new
  end

  def create
    @patient = Patient.new(patient_params)
    if @patient.valid?
      @patient.save
      redirect_to admin_patients_path
    else
      render :new
    end
  end

  def edit
    @patient = Patient.find(params[:id])
  end


  def destroy
    @patient = Patient.find(params[:id])
    @patient.destroy
    redirect_to admin_tools_tools_path
  end
  private

  def patient_params
    params.require(:patient).permit(:email, :password, :first_name, :last_name, :birthday, :allergies, appointments_attributes: [:id, :height, :weight, :bmi, :temp, :systolic, :diastolic, :heart_rate, :spo2, :rr, :visit_reason, :history, :neuro, :heent, :cardiac, :respiratory, :skin, :musculoskeletal, :psychosocial, :therapies, :tests_ordered, :follow_up], patient_meds_attributes: [:medication_id, :dosage, :instructions, :id])
  end

end
