class Admin::PatientsController < ApplicationController

  def index
    @patients = Patient.all
  end

  def show
    @patient = Patient.find(params[:id])
    @appointments = Appointment.future.available
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

  def update

  end

  def destroy

  end

  private
  def patient_params
    params.require(:patient).permit(:email, :password, :first_name, :last_name, :birthday, :allergies)
  end
end
