class Admin::DoctorsController < ApplicationController
  before_action :is_admin?

  def index
    @doctors = Doctor.all
  end

  def new
    @doctor = Doctor.new
  end

  def edit
    @doctor = Doctor.find(params[:id])
  end

  def update
    @doctor = Doctor.find(params[:id])
    @doctor.update(doc_params)
  end

  def create
    @doctor = Doctor.new(doc_params)
    if @doctor.valid?
      @doctor.save
      redirect_to doctors_path(@doctor)
    else
      redirect_to new_doctor_path
    end
  end

  private

  def doc_params
    params.require(:doctor).permit(:username, :password, :first_name, :last_name, :admin)
  end
end
