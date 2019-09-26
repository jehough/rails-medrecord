class DoctorsController < ApplicationController
  before_action :current_patient, only: [:show]
  before_action :current_doctor, only: [:home]
  before_action :is_admin?, only: [:new, :edit, :update, :create, :destroy]


  def home

  end

  def index
    if is_patient?
      current_patient
      @doctors = Doctor.all
    elsif is_admin?
      @doctors = Doctor.all
      render :admin_index
    end
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
    redirect_to doctors_path
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

  def show
    @doctor = Doctor.find(params[:id])
  end

 private

 def doc_params
   params.require(:doctor).permit(:username, :password, :first_name, :last_name, :admin, :profile_pic)
 end
end
