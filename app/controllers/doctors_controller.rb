class DoctorsController < ApplicationController

  def index
    current_patient
    @doctors = Doctor.all
  end

  def show
    current_patient
    @doctor = Doctor.find(params[:id])
  end

  def new
    is_admin?
    @doctor = Doctor.new
  end

  def create
    is_admin?
    @doctor = Doctor.new(doc_params)
    if @doctor.valid?
      @doctor.save
      redirect_to doctors_path(@doctor)
    else
      redirect_to new_doctor_path
    end
  end
end
